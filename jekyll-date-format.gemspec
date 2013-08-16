# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll-date-format/version'

Gem::Specification.new do |gem|
  gem.name          = "jekyll-date-format"
  gem.version       = Jekyll::DateFormat::VERSION
  gem.authors       = ["Brandon Mathis"]
  gem.email         = ["brandon@imathis.com"]
  gem.description   = %q{Format Jekyll page and post dates with <time> tags and timezones}
  gem.summary       = %q{Format Jekyll page and post dates with <time> tags and timezones}
  gem.homepage      = "https://github.com/octopress/jekyll-date-format"
  gem.license       = "MIT"

  gem.add_runtime_dependency 'jekyll', '>= 1.0.3'

  gem.files         = `git ls-files`.split($/)
  gem.require_paths = ["lib"]
end
