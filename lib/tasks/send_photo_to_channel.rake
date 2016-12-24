require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'fileutils'
require 'rake'
namespace :send_photo_to_channel do
  task :run => :environment do
    photo = get_photo
    return false if photo.blank?
    uri = URI.parse("#{ENV['WEB_URL']}/admin/auto/")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    desc = PhotoDescription.all.sample.description
    message = "#{desc} #{photo}"
    request.set_form_data(channel: 'test', message: message)
    response = http.request(request)
  end

  def get_photo
    index = 1
    flag = true
    photo = []
    while flag do
      doc = get_doc("http://xkcn.info/page/#{index}")
      doc.css('.post-img').each do |item|
        photo << item['src']
      end
      index += 1
      # If you dont want export all image from website
      if index == 10
        flag = false
      end
    end
    photo.sample
  end

  def get_doc(path)
    user_agent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_0) AppleWebKit/535.2 (KHTML, like Gecko) Chrome/15.0.854.0 Safari/535.2"
    Nokogiri::HTML.parse(open(path, {'User-Agent' => user_agent}))
  end
end
