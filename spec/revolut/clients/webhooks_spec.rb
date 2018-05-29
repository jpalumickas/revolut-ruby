require 'spec_helper'

RSpec.describe Revolut::Clients::Counterparties do
  let(:client) { Revolut::Client.new(api_key: 'test_key') }

  describe '#create_webhook' do
    before do
      stub_post_command(
        'webhook',
        nil,
        url: 'https://example.com/example/path'
      )
    end

    let(:response) do
      client.create_webhook(url: 'https://example.com/example/path')
    end

    it 'has correct response' do
      expect(response).to be_nil
    end
  end
end
