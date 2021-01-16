# frozen_string_literal: true

require 'bundler/setup'

require 'simplecov'

formatters = [SimpleCov::Formatter::HTMLFormatter]

if ENV['CODECOV_TOKEN']
  require 'codecov'
  formatters << SimpleCov::Formatter::Codecov
end

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(formatters)
SimpleCov.start

require 'revolut'

require 'webmock/rspec'

WebMock.disable_net_connect!(allow: ['codeclimate.com'])

Dir[File.expand_path('../spec/support/**/*.rb', __dir__)].sort.each { |f| require f }

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
