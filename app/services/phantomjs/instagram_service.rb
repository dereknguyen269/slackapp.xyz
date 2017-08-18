class Phantomjs::InstagramService < Phantomjs::BaseService

  def initialize
    super('instagram.js')
  end

  def call
    excute_js_file
  end

end
