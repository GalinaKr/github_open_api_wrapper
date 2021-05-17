# frozen_string_literal: true

source "https://rubygems.org"

# Specify your gem's dependencies in github_open_api_wrapper.gemspec

gem "rake", "~> 13.0"

gem "rspec", "~> 3.0"

gem "rubocop", "~> 1.7"

group :test do
  install_if -> { RUBY_VERSION >= '2.7.2' } do
    gem 'rexml', '>= 3.2.4'
  end
  gem 'json', '>= 2.3.0', platforms: [:jruby]
  gem 'jwt', '~> 2.2', '>= 2.2.1'
  gem 'mime-types', '~> 3.3', '>= 3.3.1'
  gem 'multi_json', '~> 1.14', '>= 1.14.1'
  gem 'netrc', '~> 0.11.0'
  gem 'rb-fsevent', '~> 0.10.3'
  gem 'rbnacl', '~> 7.1.1'
  gem 'simplecov', require: false
  gem 'vcr', '~> 5.1'
  gem 'webmock', '~> 3.8', '>= 3.8.2'
end

gemspec
