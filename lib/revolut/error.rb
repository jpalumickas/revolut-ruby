module Revolut
  # Base Revolut error.
  class Error < StandardError
    def initialize(msg = nil)
      @message = msg
    end

    # Returns the appropriate Revolut::Error sublcass based on status and
    # response message.
    #
    # @param response [Faraday::Env] HTTP response.
    #
    # @return [Revolut::Error]
    def self.from_response(response)
      status = response.status.to_i
      message = error_message(response)

      klass = error_class(status)
      klass.new(message) if klass
    end

    def self.error_class(status)
      case status
      when 400 then Revolut::BadRequest
      when 401 then Revolut::Unauthorized
      when 403 then Revolut::Forbidden
      when 404 then Revolut::NotFound
      when 405 then Revolut::MethodNotAllowed
      when 406 then Revolut::NotAcceptable
      when 429 then Revolut::TooManyRequests
      when 500 then Revolut::InternalServerError
      when 503 then Revolut::ServiceUnavailable
      end
    end

    # Returns the appropriate Revolut error message based on response
    #
    # @param response [Faraday::Env] HTTP response.
    #
    # @return [String] Revolut error message.
    def self.error_message(response)
      return unless response.body.is_a?(Hash)
      message = response.body['message']
      return unless message
      Revolut::Utils.presence(message)
    end
  end

  # Raised when Revolut returns a 400 HTTP status code
  class BadRequest < Error
    # Default error message.
    def to_s
      @message || 'Your request is invalid.'
    end
  end

  # Raised when Revolut returns a 401 HTTP status code
  class Unauthorized < Error
    # Default error message.
    def to_s
      @message || 'Your API key is wrong.'
    end
  end

  # Raised when Revolut returns a 403 HTTP status code
  class Forbidden < Error
    # Default error message.
    def to_s
      @message || 'Access to the requested resource or action is forbidden.'
    end
  end

  # Raised when Revolut returns a 404 HTTP status code
  class NotFound < Error
    # Default error message.
    def to_s
      @message || 'The requested resource could not be found.'
    end
  end

  # Raised when Revolut returns a 405 HTTP status code
  class MethodNotAllowed < Error
    # Default error message.
    def to_s
      @message || 'You tried to access an endpoint with an invalid method.'
    end
  end

  # Raised when Revolut returns a 406 HTTP status code
  class NotAcceptable < Error
    # Default error message.
    def to_s
      @message || "You requested a format that isn't JSON."
    end
  end

  # Raised when Revolut returns a 429 HTTP status code
  class TooManyRequests < Error
    # Default error message.
    def to_s
      @message || "You're sending too many requests."
    end
  end

  # Raised when Revolut returns a 500 HTTP status code
  class InternalServerError < Error
    # Default error message.
    def to_s
      @message || 'We had a problem with our server. Try again later.'
    end
  end

  # Raised when Revolut returns a 503 HTTP status code
  class ServiceUnavailable < Error
    # Default error message.
    def to_s
      @message || "We're temporarily offline for maintenance. Please try again later."
    end
  end
end
