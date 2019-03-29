# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Revolut::Clients::Accounts do
  let(:client) { Revolut::Client.new(api_key: 'test_key') }

  describe '#accounts' do
    before do
      stub_get_command('accounts', 'accounts/list')
    end

    let(:response) { client.accounts }

    it 'has correct count' do
      expect(response.length).to eq(2)
    end
  end

  describe '#account' do
    before do
      stub_get_command(
        'accounts/df8d6b20-0725-482e-a29e-fb09631480cf',
        'accounts/show'
      )
    end

    let(:response) { client.account('df8d6b20-0725-482e-a29e-fb09631480cf') }

    it 'has correct currency' do
      expect(response.currency).to eq('EUR')
    end
  end

  describe '#account_details' do
    before do
      stub_get_command(
        'accounts/df8d6b20-0725-482e-a29e-fb09631480cf/bank-details',
        'accounts/details'
      )
    end

    let(:response) { client.account_details('df8d6b20-0725-482e-a29e-fb09631480cf') }

    it 'has correct account no' do
      expect(response.first.account_no).to eq('74931241')
    end
  end
end
