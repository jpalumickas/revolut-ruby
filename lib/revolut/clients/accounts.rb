module Revolut
  module Clients
    # Revolut Accounts
    module Accounts
      # Get accounts list.
      #
      # @see https://revolutdev.github.io/business-api/?shell--production#get-accounts
      #
      # @return [Hash] Response from API.
      def accounts
        connection.get('accounts')
      end

      # Get account information.
      #
      # @see
      # https://revolutdev.github.io/business-api/?shell--sandbox#get-account
      #
      # @param id [Integer] Id of group
      #
      # @return [Hash] Response from API.
      def account(id)
        connection.get("accounts/#{id}")
      end
    end
  end
end
