require 'revolut/connection'
require 'revolut/configuration'

require 'revolut/clients/accounts'

module Revolut
  # Wrapper class for all actions.
  class Client
    include Revolut::Clients::Accounts

    # Initialize client.
    #
    # @param options [Hash] A customizable set of options.
    # @option options [String] :api_key API Key provider from Revlut.
    def initialize(options = {})
      config.api_key = options[:api_key] if options[:api_key]
      config.environment = options[:environment] if options[:environment]
    end

    # @return [Configuration]
    def config
      @config ||= Configuration.new
    end
    alias configuration config

    # Configure client with a block of settings.
    def configure
      yield(config) if block_given?
      true
    end

    # @return [Connection]
    def connection
      @connection ||= Connection.new(self)
    end
  end
end
