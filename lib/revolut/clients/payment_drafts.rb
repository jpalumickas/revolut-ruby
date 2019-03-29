# frozen_string_literal: true

module Revolut
  module Clients
    # Revolut Payment Drafts
    module PaymentDrafts
      # Get payment drafts
      #
      # @see https://revolutdev.github.io/business-api/#get-payment-drafts
      #
      # @return [Hash] Response from API.
      def payment_drafts
        connection.get('payment-drafts')
      end

      # Get payment draft
      #
      # @see https://revolutdev.github.io/business-api/#get-payment-draft-by-id
      #
      # @param id [UUID] Id of transaction.
      #
      # @return [Hash] Response from API.
      def payment_draft(id)
        connection.get("payment-drafts/#{id}")
      end

      # Create payment draft
      #
      # @see https://revolutdev.github.io/business-api/#create-payment-draft
      #
      # @param params [Hash] A customizable set of params.
      #
      # @return [Hash] Response from API.
      def create_payment_draft(params = {})
        connection.post('payment-drafts', params)
      end

      # Delete payment draft
      #
      # @see https://revolutdev.github.io/business-api/#delete-payment-draft
      #
      # @param id [UUID] Id of transaction.
      #
      # @return [Hash] Response from API.
      def delete_payment_draft(id)
        connection.delete("payment-drafts/#{id}")
      end
    end
  end
end
