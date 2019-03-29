# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Revolut::Clients::Payments do
  let(:client) { Revolut::Client.new(api_key: 'test_key') }

  describe '#transactions' do
    before do
      stub_get_command('transactions', 'payments/transactions')
    end

    let(:response) { client.transactions }

    it 'has correct count' do
      expect(response.length).to eq(3)
    end
  end

  describe '#transaction' do
    before do
      stub_get_command(
        'transaction/62b61a4f-fb09-4e87-b0ab-b66c85f5485c',
        'payments/transaction'
      )
    end

    let(:response) do
      client.transaction('62b61a4f-fb09-4e87-b0ab-b66c85f5485c')
    end

    it 'has correct reference' do
      expect(response.reference).to eq('Expenses funding')
    end
  end

  describe '#cancel_transaction' do
    before do
      stub_delete_command(
        'transaction/62b61a4f-fb09-4e87-b0ab-b66c85f5485c'
      )
    end

    let(:response) do
      client.cancel_transaction('62b61a4f-fb09-4e87-b0ab-b66c85f5485c')
    end

    it 'has correct response' do
      expect(response).to be_nil
    end
  end

  describe '#pay' do
    before do
      stub_post_command(
        'pay',
        'payments/pay',
        'account_id' => '123'
      )
    end

    let(:response) do
      client.pay(account_id: '123')
    end

    it 'has correct state' do
      expect(response.state).to eq('completed')
    end
  end

  describe '#transfer' do
    before do
      stub_post_command(
        'transfer',
        'payments/transfer',
        'request_id' => '123',
        'amount' => 20.5
      )
    end

    let(:response) do
      client.transfer(request_id: '123', amount: 20.5)
    end

    it 'has correct state' do
      expect(response.state).to eq('completed')
    end
  end
end
