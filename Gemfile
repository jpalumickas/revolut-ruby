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
  gem 'simplecov', '~> 0.16', require: false
end

# Specify your gem's dependencies in revolut.gemspec
gemspec
