# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = 'easybroker_client'
  spec.version       = '0.1.0'
  spec.authors       = ['Gabriel Locia']
  spec.email         = ['locciaa1@gmail.com']

  spec.summary       = 'Cliente API para EasyBroker'
  spec.description   = 'Un cliente para consumir la API de EasyBroker y listar propiedades.'
  spec.homepage      = 'http://example.com' #
  spec.license       = 'MIT'

  spec.files         = Dir['lib/**/*.rb']
  spec.bindir        = 'exe'
  spec.executables   = spec.name
  spec.require_paths = ['lib']

  spec.metadata['homepage_uri'] = 'http://example.com'  
  spec.metadata['source_code_uri'] = 'http://example.com'  
  spec.metadata['changelog_uri'] = 'http://example.com'  

  spec.required_ruby_version = '>= 2.6'
end
