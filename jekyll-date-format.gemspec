# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll-date-format/version'

Gem::Specification.new do |gem|
  gem.name          = "jekyll-date-format"
  gem.version       = Jekyll::DateFormat::VERSION
  gem.authors       = ["Brandon Mathis"]
  gem.email         = ["brandon@imathis.com"]
  gem.description   = %q{Renamed to octopress-date-format. - Automatically adds variables with nicely formated dates and time tags to Jekyll posts and pages.}
  gem.summary       = %q{Renamed to octopress-date-format. - Automatically adds variables with nicely formated dates and time tags to Jekyll posts and pages.}
  gem.homepage      = "https://github.com/octopress/date-format"
  gem.license       = "MIT"

  gem.add_runtime_dependency 'jekyll', '>= 1.0.0'
  gem.post_install_message = <<-MESSAGE
!    The jekyll-date-format gem has been deprecated and has been replaced by octopress-date-format.
!    See: https://rubygems.org/gems/octopress-date-format
!    And: https://github.com/octopress/date-format
MESSAGE

  gem.files         = `git ls-files`.split($/)
  gem.require_paths = ["lib"]
end
