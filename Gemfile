source "https://rubygems.org"

gem "middleman-core", git: "https://github.com/middleman/middleman.git"

# Specify your gem's dependencies in middleman-syntax.gemspec
gemspec

# Build and doc tools
gem 'rake', '~> 13.1', require: false
gem 'yard', '~> 0.9', require: false

# Test tools
gem 'pry', '~> 0.10', group: :development
gem 'aruba', '~> 1.0.0'
gem 'rspec', '~> 3.0'
gem 'cucumber', '~> 2.0'
gem 'capybara', '~> 2.5.0'
gem 'haml', RUBY_VERSION > '3.0' ? '< 7' : '< 6'
gem 'slim', '>= 3', '< 5'
gem 'kramdown'
gem "redcarpet"

# Code Quality
gem "cane", require: false

# For old Rubies
gem 'nokogiri', '~> 1.12.0'
