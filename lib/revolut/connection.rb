require 'faraday'
require 'faraday_middleware'
require 'json'

require 'revolut/mash'
require 'revolut/middleware/raise_error'

module Revolut
  # A class responsible for connecting to Revolut API and making requests.
  class Connection
    attr_reader :client

    def initialize(client)
      @client = client
    end

    def get(path, options = {})
      request(:get, path, options).body
    end

    def put(path, options = {})
      request(:put, path, {}, options).body
    end

    def post(path, options = {})
      request(:post, path, {}, options).body
    end

    def delete(path, options = {})
      request(:delete, path, options).body
    end

    private

    def request(method, path, query_params = {}, body_params = {})
      response = connection.send(method) do |request|
        request.url(path, query_params)
        request.headers['Content-Type'] = 'application/json'

        if client.config.api_key
          request.headers['Authorization'] = "Bearer #{client.config.api_key}"
        end

        request.body = body_params.to_json
      end

      response
    end

    def connection
      conn_opts = {
        headers: { user_agent: client.config.user_agent },
        url: client.config.url,
        builder: middleware
      }

      Faraday.new(conn_opts)
    end

    def middleware
      @middleware ||= Faraday::RackBuilder.new do |builder|
        builder.request :json

        builder.use FaradayMiddleware::FollowRedirects
        builder.use FaradayMiddleware::Mashify, mash_class: Revolut::Mash
        builder.use Revolut::Middleware::RaiseError
        builder.use FaradayMiddleware::ParseJson

        builder.adapter Faraday.default_adapter
      end
    end
  end
end
