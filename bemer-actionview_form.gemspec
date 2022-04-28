# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)

$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'bemer/action_view/form/version'

Gem::Specification.new do |spec|
  spec.name             = 'bemer-actionview_form'
  spec.version          = Bemer::ActionView::Form::VERSION
  spec.author           = 'Alexander Grigorev'
  spec.email            = 'vill@rubyinventory.org'
  spec.summary          = 'Add the BEM methodology to your ActionView forms.'
  spec.description      = 'Add the BEM methodology to your ActionView forms.'
  spec.license          = 'MIT'
  spec.require_paths    = ['lib']
  spec.files            = Dir['lib/**/*.rb', 'LICENSE-RU.txt', 'LICENSE.txt']
  spec.test_files       = Dir['spec/**/*']
  spec.extra_rdoc_files = Dir['README.md', 'docs/*.md']

  spec.metadata = {
    'bug_tracker_uri' => 'https://github.com/vill/bemer-actionview_form/issues',
    'homepage_uri'    => 'https://github.com/vill/bemer-actionview_form',
    'source_code_uri' => 'https://github.com/vill/bemer-actionview_form'
  }

  spec.required_ruby_version     = '>= 2.3.0'
  spec.required_rubygems_version = '>= 2.2.0'

  spec.add_development_dependency 'bundler',             '~> 1.16'
  spec.add_development_dependency 'bundler-audit',       '~> 0.6.1'
  spec.add_development_dependency 'fasterer',            '~> 0.5.1'
  spec.add_development_dependency 'overcommit',          '~> 0.48.0'
  spec.add_development_dependency 'rake',                '~> 12.3.0'
  spec.add_development_dependency 'rubocop',             '~> 0.70.0'
  spec.add_development_dependency 'rubocop-performance', '~> 1.3.0'
  spec.add_development_dependency 'rubocop-rspec',       '~> 1.33.0'

  spec.add_runtime_dependency 'actionview', '>= 4.1.0', '< 7.1'
  spec.add_runtime_dependency 'bemer',      '>= 0.1.0', '< 1.0'
end
