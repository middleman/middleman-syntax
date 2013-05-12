# -*- encoding: utf-8 -*-
require File.expand_path(File.join("..", "lib", "middleman-syntax", "version"), __FILE__)

Gem::Specification.new do |s|
  s.name        = "middleman-syntax"
  s.version     = Middleman::Syntax::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ben Hollis"]
  s.email       = ["ben@benhollis.net"]
  s.homepage    = "https://github.com/middleman/middleman-syntax"
  s.summary     = %q{Syntax-highlighting helpers for Middleman}
  s.description = %q{Syntax-highlighting helpers for Middleman}

  s.files         = `git ls-files -z`.split("\0")
  s.test_files    = `git ls-files -z -- {fixtures,features}/*`.split("\0")
  s.require_paths = ["lib"]

  s.add_runtime_dependency("middleman-core", "~> 3.0")
  s.add_runtime_dependency("rouge", "~> 0.3.0")
end
