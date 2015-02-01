source "https://rubygems.org"

gem "middleman-core", :github => "middleman/middleman", :branch => 'v3-stable'

# Specify your gem's dependencies in middleman-syntax.gemspec
gemspec

gem "rake",     "~> 10.1.0", :require => false
gem "yard",     "~> 0.8.0", :require => false

platforms :ruby do
  gem "redcarpet"
end

# Code Quality
gem "cane", :platforms => [:mri_19, :mri_20], :require => false
