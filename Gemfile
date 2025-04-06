source "https://rubygems.org"

# Use a specific version compatible with Ruby 2.7.2
gem "middleman-core", "~> 4.3.11"

# Specify your gem's dependencies in middleman-syntax.gemspec
gemspec

# Build and doc tools
gem 'rake', '~> 12.3.3', require: false
gem 'yard', '~> 0.9', require: false

# Test tools
# Using older version to avoid conflicts with middleman
gem 'aruba', '~> 0.14.14'
gem 'cucumber', '~> 4.1.0'
gem 'capybara', '~> 3.35.0'

# Optional dependencies, included for tests
gem 'haml', RUBY_VERSION > '3.0' ? '< 7' : '< 6'
gem 'slim', '>= 3', '< 5'
gem 'kramdown'
gem 'redcarpet'
gem 'rack', '< 3'
