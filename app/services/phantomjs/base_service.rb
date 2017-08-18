require 'phantomjs'

class Phantomjs::BaseService

  PHANTOMJS_DIR = Rails.root.join('app', 'assets', 'javascripts', 'phantomjs').to_s

  def initialize(js_file)
    @js_file = [PHANTOMJS_DIR, js_file].join('/')
  end

  def excute_js_file
    Phantomjs.run(@js_file) do |response|
      STDERR.puts response.inspect
    end
  end

end
