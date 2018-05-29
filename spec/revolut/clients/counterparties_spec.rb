require 'spec_helper'

RSpec.describe Revolut::Clients::Counterparties do
  let(:client) { Revolut::Client.new(api_key: 'test_key') }

  describe '#counterparties' do
    before do
      stub_get_command('counterparties', 'counterparties/list')
    end

    let(:response) { client.counterparties }

    it 'has correct count' do
      expect(response.length).to eq(2)
    end
  end

  describe '#counterparty' do
    before do
      stub_get_command(
        'counterparty/ce851ec3-e018-47e8-894d-089fe8c6b6c8',
        'counterparties/show'
      )
    end

    let(:response) do
      client.counterparty('ce851ec3-e018-47e8-894d-089fe8c6b6c8')
    end

    it 'has correct name' do
      expect(response.name).to eq('John Smith')
    end
  end

  describe '#add_counterparty' do
    before do
      stub_post_command(
        'counterparty',
        'counterparties/create',
        profile_name: 'personal',
        name: 'John Smith',
        phone: '+44723456789'
      )
    end

    let(:response) do
      client.add_counterparty(
        profile_name: :personal,
        name: 'John Smith',
        phone: '+44723456789'
      )
    end

    it 'has correct name' do
      expect(response.name).to eq('John Smith')
    end
  end

  describe '#delete_counterparty' do
    before do
      stub_delete_command(
        'counterparty/ce851ec3-e018-47e8-894d-089fe8c6b6c8'
      )
    end

    let(:response) do
      client.delete_counterparty('ce851ec3-e018-47e8-894d-089fe8c6b6c8')
    end

    it 'has correct response' do
      expect(response).to be_nil
    end
  end
end
