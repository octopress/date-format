# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'octopress-date-format/version'

Gem::Specification.new do |spec|
  spec.name          = "octopress-date-format"
  spec.version       = Octopress::DateFormat::VERSION
  spec.authors       = ["Brandon Mathis"]
  spec.email         = ["brandon@imathis.com"]
  spec.description   = %q{Adds nicely formated dates to Jekyll posts and pages. (formerly: 'jekyll-date-format')}
  spec.summary       = %q{Adds nicely formated dates to Jekyll posts and pages. (formerly: 'jekyll-date-format')}
  spec.homepage      = "https://github.com/octopress/date-format"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").grep(/^(bin\/|lib\/|assets\/|demo\/|changelog|readme|license)/i)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'octopress-hooks', '~> 2.0'
  spec.add_runtime_dependency 'jekyll', '~> 2.0'

  spec.add_development_dependency 'clash', '~> 1.0'
  spec.add_development_dependency "rake"
  
  if RUBY_VERSION >= "2"
    spec.add_development_dependency "pry-byebug"
  end
end
