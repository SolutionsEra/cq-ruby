require 'json'
require 'forwardable'
# require_relative "http_client"

module CQ  
  class Client

    # The configuration options for this client instance
    attr_reader :options

    DEFAULT_OPTIONS = {
      :auth_type          => :basic
    }

    def initialize(options={})
      options = DEFAULT_OPTIONS.merge(options)
      options[:site] ||= 'http://localhost:4502'
      @options = options

      case options[:auth_type]
      when :basic
        @request_client = HttpClient.new(@options)
      end

      @options.freeze
    end

    # HTTP methods without a body
    def delete(path, headers = {})
      request(:delete, path, nil, merge_default_headers(headers))
    end

    def get(path, headers = {})
      request(:get, path, nil, merge_default_headers(headers))
    end

    def head(path, headers = {})
      request(:head, path, nil, merge_default_headers(headers))
    end

    # HTTP methods with a body
    def post(path, body = '', headers = {})
      headers = {'Content-Type' => 'application/json'}.merge(headers)
      request(:post, path, body, merge_default_headers(headers))
    end

    def put(path, body = '', headers = {})
      headers = {'Content-Type' => 'application/json'}.merge(headers)
      request(:put, path, body, merge_default_headers(headers))
    end

    # Sends the specified HTTP request to the REST API through the
    # appropriate method (oauth, basic).
    def request(http_method, path, body = '', headers={})
      @request_client.request(http_method, path, body, headers)
    end

    protected

      def merge_default_headers(headers)
        {'Accept' => 'application/json'}.merge(headers)
      end

  end
end

