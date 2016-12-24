require 'google-search'
module Search
  class Web

    def self.find(query)
      search = Google::Search::Web.new do |search|
        search.query = query
        search.size = :large
        search.each_response { print '.'; $stdout.flush }
      end
      search.find { |item| item.uri =~ uri }
    end

  end
end
