# frozen_string_literal: true

module Revolut
  # Faraday response middleware
  module Middleware
    # This class raises an exception based HTTP status codes returned
    # by the API.
    class RaiseError < Faraday::Response::Middleware
      def on_complete(response)
        error = Revolut::Error.from_response(response)
        raise error if error
      end
    end
  end
end
