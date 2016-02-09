$:.push File.expand_path('../lib', __FILE__)
require 'lomadee/version'

Gem::Specification.new do |s|
  s.name        = 'lomadee'
  s.version     = Lomadee::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Rogério Zambon']
  s.email       = ['rogeriozambon@gmail.com']
  s.homepage    = 'http://github.com/rogeriozambon/lomadee'
  s.summary     = 'A lightweight Ruby wrapper for Lomadee (Buscapé)'
  s.description = s.summary

  s.files         = `git ls-files`.split('\n')
  s.require_paths = ['lib']

  s.add_dependency 'rake'
  s.add_dependency 'faraday', '>= 0.9.2'
  s.add_dependency 'json', '>= 1.8.3'

  s.add_development_dependency 'fakeweb', '>= 1.3.0'
  s.add_development_dependency 'rspec', '>= 3.4.0'
end
