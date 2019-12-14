# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Revolut::Clients::Exchanges do
  let(:client) { Revolut::Client.new(api_key: 'test_key') }

  describe '#exchange_rate' do
    before do
      stub_get_command(
        'rate',
        'exchanges/rate',
        from: 'EUR', to: 'GBP', amount: 100
      )
    end

    let(:response) { client.exchange_rate(from: 'EUR', to: 'GBP', amount: 100) }

    it 'has correct count' do
      expect(response.rate).to eq(0.789)
    end
  end

  describe '#exchange' do
    before do
      stub_post_command(
        'exchange',
        'exchanges/exchange',
        reference: 'test'
      )
    end

    let(:response) { client.exchange(reference: 'test') }

    it 'has correct count' do
      expect(response.id).to eq('d56d5596-523b-4613-2cc7-54974a37bcac')
    end
  end
end
