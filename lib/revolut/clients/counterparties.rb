# frozen_string_literal: true

module Revolut
  module Clients
    # Revolut Accounts
    module Counterparties
      # List counterparties
      #
      # @see https://revolutdev.github.io/business-api/?shell--production#get-counterparties
      #
      # @return [Hash] Response from API.
      def counterparties
        connection.get('counterparties')
      end

      # Get Counterparty
      #
      # @see https://revolutdev.github.io/business-api/?shell--production#get-counterparty
      #
      # @param id [UUID] Id of counterparty.
      #
      # @return [Hash] Response from API.
      def counterparty(id)
        connection.get("counterparty/#{id}")
      end

      # Add Revolut Counterparty
      #
      # @see https://revolutdev.github.io/business-api/?shell--production#add-revolut-counterparty
      #
      # @return [Hash] Response from API.
      def add_counterparty(params = {})
        connection.post('counterparty', params)
      end

      # Delete Counterparty
      #
      # @see https://revolutdev.github.io/business-api/?shell--production#delete-counterparty
      #
      # @param id [UUID] Id of counterparty.
      #
      # @return [Hash] Response from API.
      def delete_counterparty(id)
        connection.delete("counterparty/#{id}")
      end
    end
  end
end
