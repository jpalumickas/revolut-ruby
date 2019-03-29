# frozen_string_literal: true

module Revolut
  module Clients
    # Revolut Webhooks
    module Webhooks
      # Create webhook
      #
      # @see https://revolutdev.github.io/business-api/?shell--production#setting-up-a-web-hook
      #
      # @param params [Hash] A customizable set of params.
      # @option params [String] :url Call back endpoint of the client system,
      #   https is the supported protocol.
      #
      # @return [Hash] Response from API.
      def create_webhook(params = {})
        connection.post('webhook', params)
      end
    end
  end
end
