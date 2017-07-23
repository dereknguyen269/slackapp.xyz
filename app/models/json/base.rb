module Json

  class Base

    JSON_DATA_PATH = "app/assets/javascripts/data".freeze

    def initialize
      @records = JSON.parse(records)
    end

    def current_class_name
      self.class
    end

    def all
      @records
    end

    def model_file_name
      fn = "#{current_class_name}".underscore.gsub('json/', '')
      "#{fn}s.json".freeze
    end

    def model_file_path
      Rails.root.join(JSON_DATA_PATH, model_file_name)
    end

    def records
      File.exist?(model_file_path) ? File.read(model_file_path) : "{}"
    end

  end

end
