# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'octopress-date-format/version'

Gem::Specification.new do |gem|
  gem.name          = "octopress-date-format"
  gem.version       = Octopress::DateFormat::VERSION
  gem.authors       = ["Brandon Mathis"]
  gem.email         = ["brandon@imathis.com"]
  gem.description   = %q{Adds nicely formated dates to Jekyll posts and pages. (formerly: 'jekyll-date-format')}
  gem.summary       = %q{Adds nicely formated dates to Jekyll posts and pages. (formerly: 'jekyll-date-format')}
  gem.homepage      = "https://github.com/octopress/date-format"
  gem.license       = "MIT"

  gem.add_runtime_dependency 'octopress-hooks', '~> 2.0'
  gem.add_runtime_dependency 'jekyll', '~> 2.0'

  gem.add_development_dependency 'clash', '~> 1.0'

  gem.files         = `git ls-files`.split($/)
  gem.require_paths = ["lib"]
end
