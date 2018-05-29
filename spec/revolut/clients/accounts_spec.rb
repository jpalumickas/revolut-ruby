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
end
