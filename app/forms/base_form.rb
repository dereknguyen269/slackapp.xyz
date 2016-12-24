class BaseForm

  include ActiveModel::Model
  include ActiveModel::Validations

  def attributes
    self.class.attrs.each_with_object(ActiveSupport::HashWithIndifferentAccess.new) do |key, hash|
      hash[key] = instance_variable_get("@#{key}")
    end
  end

  class << self

    attr_reader :attrs

    def inherited(base)
      base.instance_variable_set(:@attrs, @attrs)
    end

    def i18n_scope
      :form
    end

    private

    def attr_accessor(*args)
      @attrs ||= []
      @attrs.concat args
      super(*args)
    end

  end

end
