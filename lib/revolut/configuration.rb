module Revolut
  # A class responsible for all configurations.
  class Configuration
    # Default API endpoint.
    PRODUCTION_API_ENDPOINT = 'https://b2b.revolut.com/api/1.0'.freeze
    SANDBOX_API_ENDPOINT = 'https://sandbox-b2b.revolut.com/api/1.0'.freeze

    # Default User Agent header string.
    USER_AGENT = "Revolut Ruby v#{Revolut::VERSION}".freeze

    attr_accessor :api_key
    attr_writer :url, :user_agent, :environment

    # Takes url provided from configuration or uses default one.
    #
    # @return [String] An API Endpoint url which will be used for connection.
    def url
      return @url if @url

      if environment == :production
        PRODUCTION_API_ENDPOINT
      elsif environment == :sandbox
        SANDBOX_API_ENDPOINT
      end
    end

    # Takes user agent from configuration or uses default one.
    #
    # @return [String] User agent which will be used for connection headers.
    def user_agent
      @user_agent || USER_AGENT
    end

    def environment
      @environment || :production
    end
  end
end
