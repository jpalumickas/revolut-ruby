# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Revolut::Clients::PaymentDrafts do
  let(:client) { Revolut::Client.new(api_key: 'test_key') }

  describe '#payment_drafts' do
    before do
      stub_get_command('payment-drafts', 'payment_drafts/list')
    end

    let(:response) { client.payment_drafts }

    it 'has correct count' do
      expect(response.payment_orders.length).to eq(1)
    end
  end

  describe '#payment_draft' do
    before do
      stub_get_command(
        'payment-drafts/62b61a4f-fb09-4e87-b0ab-b66c85f5485c',
        'payment_drafts/show'
      )
    end

    let(:response) do
      client.payment_draft('62b61a4f-fb09-4e87-b0ab-b66c85f5485c')
    end

    it 'has correct name' do
      expect(response.title).to eq('Title of payment')
    end
  end

  describe '#create_payment_draft' do
    before do
      stub_post_command(
        'payment-drafts',
        'payment_drafts/create',
        title: 'Title of payment'
      )
    end

    let(:response) do
      client.create_payment_draft(
        title: 'Title of payment'
      )
    end

    it 'has correct name' do
      expect(response.title).to eq('Title of payment')
    end
  end

  describe '#delete_payment_draft' do
    before do
      stub_delete_command(
        'payment-drafts/ce851ec3-e018-47e8-894d-089fe8c6b6c8'
      )
    end

    let(:response) do
      client.delete_payment_draft('ce851ec3-e018-47e8-894d-089fe8c6b6c8')
    end

    it 'has correct response' do
      expect(response).to be_nil
    end
  end
end
