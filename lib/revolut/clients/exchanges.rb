# frozen_string_literal: true

module Revolut
  module Clients
    # Revolut Exchanges
    module Exchanges
      def exchange_rate(from:, to:, amount:)
        connection.get('rate', from: from, to: to, amount: amount)
      end

      def exchange(params = {})
        connection.post('exchange', params)
      end
    end
  end
end
