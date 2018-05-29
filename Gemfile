source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

group :development do
  gem 'rubocop', '~> 0.56'
end

group :development, :test do
  gem 'pry'
end

group :test do
  gem 'rake' # For Travis CI
  gem 'rspec', '~> 3.7'
  gem 'simplecov', '~> 0.16', require: false
  gem 'webmock', '~> 3.4'
end

# Specify your gem's dependencies in revolut.gemspec
gemspec
