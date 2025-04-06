source "https://rubygems.org"

# Use a specific version compatible with Ruby 2.7.2
gem "middleman-core", "~> 4.3.11"

# Specify your gem's dependencies in middleman-syntax.gemspec
gemspec

# Build and doc tools
gem 'rake', '~> 13.1', require: false
gem 'yard', '~> 0.9', require: false

# Test tools
gem 'aruba'
gem 'cucumber'
gem 'capybara'

# Optional dependencies, included for tests
gem 'haml', RUBY_VERSION > '3.0' ? '< 7' : '< 6'
gem 'slim', '>= 3', '< 5'
gem 'kramdown'
gem 'redcarpet'
gem 'rack', '< 3'
