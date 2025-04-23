# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name                   = 'rubicons'
  spec.version                = '0.7.0'
  spec.authors                = ['insomnius']
  spec.email                  = ['awake@insomnius.dev']
  spec.summary                = 'Lightweight, pure Ruby SVG icon toolkit inspired by React Icons.'
  spec.description            = 'Rubicons is a pure Ruby icon toolkit inspired by react-icons, offering a simple and consistent way to include SVG-based icons in your Ruby applications without external dependencies.'
  spec.homepage               = 'https://github.com/insomnius/rubicons'
  spec.license                = 'MIT'
  spec.required_ruby_version  = '>= 3.2.0'

  spec.files          = Dir['lib/**/*', 'README.md', 'LICENSE', 'icons/**/*']
  spec.require_paths  = ['lib']
end
