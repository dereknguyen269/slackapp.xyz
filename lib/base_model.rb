class BaseModel

  def initialize
    data_path = 'app/assets/javascripts/data'
    file_name = "#{current_class_name}".underscore.gsub('_json_model', '.json')
    records = File.read(File.join(data_path, file_name))
    @records = JSON.parse(records)
  end

  def current_class_name
    self.class
  end

  def all
    @records
  end

end
