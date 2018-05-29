module Revolut
  module Clients
    # Revolut Webhooks
    module Webhooks
      # Create webhook
      #
      # @see https://revolutdev.github.io/business-api/?shell--sandbox#setting-up-a-web-hook
      #
      # @return [Hash] Response from API.
      def create_webhook(params = {})
        connection.post('webhook', params)
      end
    end
  end
end
