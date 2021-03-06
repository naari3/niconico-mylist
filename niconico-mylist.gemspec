# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'niconico/mylist/version'

Gem::Specification.new do |spec|
  spec.name          = 'niconico-mylist'
  spec.version       = Niconico::Mylist::VERSION
  spec.authors       = ['naari3']
  spec.email         = ['naari.named@gmail.com']

  spec.summary       = 'Fetch niconico mylist'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/naari3/niconico-mylist'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday'
  spec.add_dependency 'faraday-encoding'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec_junit_formatter'
  spec.add_development_dependency 'webmock'
end
