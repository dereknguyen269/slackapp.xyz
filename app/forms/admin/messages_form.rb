class Admin::MessagesForm < BaseForm

  def initialize(message, params = {})
    @message = message
    super(params)
  end

  def message_attributes=(attrs)
    @message.assign_attributes(attrs)
  end

  def save
    @message.save!
  rescue ActiveRecord::RecordInvalid
    errors.add(:message, :invalid)
    false
  end

end
