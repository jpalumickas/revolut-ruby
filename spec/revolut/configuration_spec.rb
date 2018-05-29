require 'spec_helper'

RSpec.describe Revolut::Configuration do
  let(:config) { Revolut::Configuration.new }
  let(:version) { Revolut::VERSION }

  describe '#url' do
    it 'has correct default value' do
      expect(config.url).to eq('https://b2b.revolut.com/api/1.0')
    end

    it 'has correct custom value' do
      config.url = 'test_url'
      expect(config.url).to eq('test_url')
    end

    it 'has correct value on sandbox environment' do
      config.environment = :sandbox
      expect(config.url).to eq('https://sandbox-b2b.revolut.com/api/1.0')
    end
  end

  describe '#user_agent' do
    it 'has correct value' do
      expect(config.user_agent).to eq("Revolut Ruby v#{version}")
    end

    it 'has correct custom value' do
      config.user_agent = 'My user agent'
      expect(config.user_agent).to eq('My user agent')
    end
  end

  describe '#environment' do
    it 'has correct value' do
      expect(config.environment).to eq(:production)
    end

    it 'has correct value when set to sandbox' do
      config.environment = :sandbox
      expect(config.environment).to eq(:sandbox)
    end

    it 'has correct value when set to sandbox with string' do
      config.environment = 'sandbox'
      expect(config.environment).to eq(:sandbox)
    end

    it 'raises an error when invalid environment provided' do
      expect { config.environment = :invalid }.to raise_error(
        Revolut::Error,
        'Invalid environment provided.'
      )
    end

    it 'raises an error when invalid value provided' do
      expect { config.environment = 123 }.to raise_error(
        Revolut::Error,
        'Invalid environment provided.'
      )
    end
  end
end
