# Revolut API Ruby wrapper

A Ruby gem which helps to communicate with [Revolut Business][revolut] API.

[![Gem Version](https://img.shields.io/gem/v/revolut.svg?style=flat-square)][rubygems]
[![Build Status](https://img.shields.io/travis/jpalumickas/revolut-ruby.svg?style=flat-square)][travis]

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'revolut'
```

## Usage

### Authentication

When you sign up for an account, you can generate production or sandbox **API key** in settings page.
You will need this API key to communicate with [Revolut][revolut] API.
When testing, you should use Sandbox environment.

Before making any request, you should authenticate first. Use the response object to
make requests afterward.


```ruby
client = Revolut::Client.new(api_key: 'my-secret-api-key')
```

Example:

```ruby
client.accounts
```

Or create file under `config/initializers/revolut.rb`

```ruby
Revolut.configure do |config|
  config.api_key = 'my-secret-api-key'
  config.environment = :sandbox  # :production
end
```

When you configured global settings in file, then you can request methods
on `Revolut` class directly.

Example:

```ruby
Revolut.accounts
```

## Supported Ruby Versions

This library aims to support and is [tested against][travis] the following Ruby
implementations:

* Ruby 2.2.0
* Ruby 2.3.0
* Ruby 2.4.0
* Ruby 2.5.0
* Ruby 2.6.0

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jpalumickas/revolut-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Revolut project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/jpalumickas/revolut-ruby/blob/master/CODE_OF_CONDUCT.md).

[rubygems]: https://rubygems.org/gems/revolut
[travis]: https://travis-ci.org/jpalumickas/revolut-ruby

[revolut]: https://www.revolut.com
