// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the rails generate channel command.
//
//= require_self
//= require_tree ./channels

// (function() {
//   this.App || (this.App = {});
//   App.cable = ActionCable.createConsumer();

// }).call(this);
ActionCable = require('actioncable-modules');
window.App  = {}
// App.cable = ActionCable.createConsumer('ws://localhost:28080');
console.log(App);