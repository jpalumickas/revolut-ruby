# frozen_string_literal: true

module Revolut
  module Clients
    # Revolut Payments
    module Payments
      # Transfer payment
      #
      # @see https://revolutdev.github.io/business-api/?shell--production#transfer
      #
      # @param params [Hash] A customizable set of params.
      #
      # @return [Hash] Response from API.
      def transfer(params = {})
        connection.post('transfer', params)
      end

      # Create payment
      #
      # @see https://revolutdev.github.io/business-api/?shell--production#create-payment
      #
      # @param params [Hash] A customizable set of params.
      #
      # @return [Hash] Response from API.
      def pay(params = {})
        connection.post('pay', params)
      end

      # List transactions
      #
      # @see https://revolutdev.github.io/business-api/?shell--production#get-transactions
      #
      # @return [Hash] Response from API.
      def transactions
        connection.get('transactions')
      end

      # Get transaction
      #
      # @see https://revolutdev.github.io/business-api/?shell--production#check-payment-status
      #
      # @param id [UUID] Id of transaction.
      #
      # @return [Hash] Response from API.
      def transaction(id, params = {})
        connection.get("transaction/#{id}", params)
      end

      # Cancel transaction
      #
      # @see https://revolutdev.github.io/business-api/?shell--production#cancel-payment
      #
      # @param id [UUID] Id of transaction.
      #
      # @return [Hash] Response from API.
      def cancel_transaction(id)
        connection.delete("transaction/#{id}")
      end
    end
  end
end
