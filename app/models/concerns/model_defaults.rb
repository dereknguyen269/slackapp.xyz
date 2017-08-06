module ModelDefaults
  extend ActiveSupport::Concern

  included do
    after_initialize :apply_default_values
  end

  # Callback for setting default values
  def apply_default_values
    self.class.defaults.each do |attribute, param|
      next unless self.send(attribute).nil?
      value = param.respond_to?(:call) ? param.call(self) : param
      self[attribute] = value
    end
  end

  # Added to class of object
  class_methods do
    def default(attribute, value = nil, &block)
      defaults[attribute] = value
      # Allow the passing of blocks
      defaults[attribute] = block if block_given?
    end

    def defaults
      @defaults ||= {}
    end
  end
end
