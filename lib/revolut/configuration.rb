# frozen_string_literal: true

module Revolut
  # A class responsible for all configurations.
  class Configuration
    PRODUCTION_API_ENDPOINT = 'https://b2b.revolut.com/api/1.0'
    SANDBOX_API_ENDPOINT = 'https://sandbox-b2b.revolut.com/api/1.0'
    AVAILABLE_ENVIRONMENTS = %i[production sandbox].freeze
    DEFAULT_ENVIRONMENT = :production
    USER_AGENT = "Revolut Ruby v#{Revolut::VERSION}"

    attr_accessor :api_key
    attr_writer :url, :user_agent

    # Takes url provided from configuration or uses default one.
    #
    # @return [String] An API Endpoint url which will be used for connection.
    def url
      return @url if @url

      case environment
      when :production
        PRODUCTION_API_ENDPOINT
      when :sandbox
        SANDBOX_API_ENDPOINT
      end
    end

    # Takes user agent from configuration or uses default one.
    #
    # @return [String] User agent which will be used for connection headers.
    def user_agent
      @user_agent || USER_AGENT
    end

    # Takes environment from configuration or uses default one.
    # It will be used to set url automatically.
    #
    # @return [Symbol] Environment which will be used to set url.
    def environment
      @environment || DEFAULT_ENVIRONMENT
    end

    # Sets environment which will be used for url.
    #
    # @return [Symbol] Environment which will be used to set url.
    def environment=(environment)
      env_sym = environment.is_a?(String) ? environment.to_sym : environment

      raise Revolut::Error, 'Invalid environment provided.' unless AVAILABLE_ENVIRONMENTS.include?(env_sym)

      @environment = env_sym
    end
  end
end
