# encoding: UTF-8
$:.push File.expand_path('../lib', __FILE__)
require 'solidus_starter_frontend/version'

Gem::Specification.new do |s|
  s.name        = 'solidus_starter_frontend'
  s.version     = SolidusStarterFrontend::VERSION
  s.summary     = 'Cart and storefront for the Solidus e-commerce project.'
  s.description = 'Placeholder description.'
  s.license     = 'BSD-3-Clause'

  s.author    = 'Nebulab'
  s.email     = 'hello@nebulab.it'
  s.homepage  = 'https://www.nebulab.it'

  s.files = Dir["{app,config,db,lib}/**/*", 'LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'solidus_core', ['>= 2.0', '< 3']
  s.add_dependency 'solidus_api', ['>= 2.0', '< 3']
  s.add_dependency 'canonical-rails', '~> 0.2.0'
  s.add_dependency 'truncate_html', '~> 0.9', '>= 0.9.2'

  s.add_development_dependency 'solidus_dev_support'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'byebug'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'rails-controller-testing'
  s.add_development_dependency 'rspec-activemodel-mocks'
end
