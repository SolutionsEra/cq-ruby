require 'json'
require 'net/https'
# require_relative "http_error"

module CQ
  class RequestClient

    def request(*args)
      response = make_request(*args)
      raise HTTPError.new(response) unless response.kind_of?(Net::HTTPSuccess)
      response
    end
  end
end

# class Bar
#   def name
#     name_test
#   end
# end

# class Foo < Bar
#   def name_test
#     puts "Hello World"
#   end
# end  

# a = Foo.new
# puts a.name
