class Phantomjs::TestService < Phantomjs::BaseService

  def initialize
    super('test.js')
  end

  def call
    excute_js_file
  end

end
