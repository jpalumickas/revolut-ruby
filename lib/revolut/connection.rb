# frozen_string_literal: true

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
        add_request_headers!(request)

        if Revolut::Utils.present?(body_params)
          request.body = body_params.to_json
        end
      end

      response
    end

    def add_request_headers!(request)
      request.headers['Content-Type'] = 'application/json'
      request.headers['Accept'] = 'application/json'

      return unless client.config.api_key

      request.headers['Authorization'] = "Bearer #{client.config.api_key}"
    end

    def connection
      Faraday.new(connection_options) do |builder|
        builder.request :json

        builder.response :mashify, mash_class: Revolut::Mash
        builder.use Revolut::Middleware::RaiseError
        builder.response :json

        builder.adapter Faraday.default_adapter
      end
    end

    def connection_options
      {
        headers: { user_agent: client.config.user_agent },
        url: client.config.url
      }
    end
  end
end
