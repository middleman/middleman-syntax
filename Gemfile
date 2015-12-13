source "https://rubygems.org"

gem "middleman-core", :github => "middleman/middleman", :branch => 'v3-stable'

# Specify your gem's dependencies in middleman-syntax.gemspec
gemspec

# Build and doc tools
gem 'rake', '~> 10.3', require: false
gem 'yard', '~> 0.8', require: false

# Test tools
gem 'pry', '~> 0.10', group: :development
gem 'aruba', '~> 0.10.0'
gem 'rspec', '~> 3.0'
gem 'cucumber', '~> 2.0'

platforms :ruby do
  gem "redcarpet"
end

# Code Quality
gem "cane", :platforms => [:mri_19, :mri_20], :require => false
