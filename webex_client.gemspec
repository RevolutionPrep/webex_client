# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'webex_client/version'

Gem::Specification.new do |gem|
  gem.name          = "webex_client"
  gem.version       = WebexClient::VERSION
  gem.authors       = ["Larry Sprock"]
  gem.email         = ["larry.sprock@revolutionprep.com"]
  gem.description   = %q{Webex wrapper for interacting with webex}
  gem.summary       = %q{Webex wrapper}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'mechanize'
  gem.add_dependency 'nokogiri'
  gem.add_dependency 'addressable'

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'mocha'
  gem.add_development_dependency 'fuubar'
  gem.add_development_dependency 'vcr'
  gem.add_development_dependency 'fakeweb'
end
