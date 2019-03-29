# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Revolut do
  it 'has a version number' do
    expect(Revolut::VERSION).not_to be nil
  end

  it 'has a client class' do
    expect(Revolut.client).to be_a(Revolut::Client)
  end

  it 'responds to config' do
    expect(Revolut.respond_to?(:config)).to be_truthy
  end

  context 'configuration' do
    before do
      Revolut.configure do |config|
        config.api_key = 'testing'
      end
    end

    it 'has correct api key' do
      expect(Revolut.config.api_key).to eq('testing')
    end
  end
end
