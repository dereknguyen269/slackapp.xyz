# Collection class for creating (and internally managing) channel subscriptions. The only method intended to be triggered by the user
# us Cable.Subscriptions#create, and it should be called through the consumer like so:
#
#   @App = {}
#   App.cable = Cable.createConsumer "ws://example.com/accounts/1"
#   App.appearance = App.cable.subscriptions.create "AppearanceChannel"
#
# For more details on how you'd configure an actual channel subscription, see Cable.Subscription.
class Cable.Subscriptions
  constructor: (@consumer) ->
    @subscriptions = []
    @history = []

  create: (channelName, mixin) ->
    channel = channelName
    params = if typeof channel is "object" then channel else {channel}
    new Cable.Subscription this, params, mixin

  # Private

  add: (subscription) ->
    @subscriptions.push(subscription)
    @notify(subscription, "initialized")
    @sendCommand(subscription, "subscribe")

  remove: (subscription) ->
    @forget(subscription)

    unless @findAll(subscription.identifier).length
      @sendCommand(subscription, "unsubscribe")

  reject: (identifier) ->
    for subscription in @findAll(identifier)
      @forget(subscription)
      @notify(subscription, "rejected")

  forget: (subscription) ->
    @subscriptions = (s for s in @subscriptions when s isnt subscription)

  findAll: (identifier) ->
    s for s in @subscriptions when s.identifier is identifier

  reload: ->
    for subscription in @subscriptions
      @sendCommand(subscription, "subscribe")

  notifyAll: (callbackName, args...) ->
    for subscription in @subscriptions
      @notify(subscription, callbackName, args...)

  notify: (subscription, callbackName, args...) ->
    if typeof subscription is "string"
      subscriptions = @findAll(subscription)
    else
      subscriptions = [subscription]

    for subscription in subscriptions
      subscription[callbackName]?(args...)

      if callbackName in ["initialized", "connected", "disconnected", "rejected"]
        {identifier} = subscription
        @record(notification: {identifier, callbackName, args})

  sendCommand: (subscription, command) ->
    {identifier} = subscription
    if identifier is Cable.INTERNAL.identifiers.ping
      @consumer.connection.isOpen()
    else
      @consumer.send({command, identifier})

  record: (data) ->
    data.time = new Date()
    @history = @history.slice(-19)
    @history.push(data)

  toJSON: ->
    history: @history
    identifiers: (subscription.identifier for subscription in @subscriptions)
