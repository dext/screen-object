lib = File.expand_path 'lib', __dir__
$LOAD_PATH.unshift lib unless $LOAD_PATH.include? lib

require 'screen-object/version'

Gem::Specification.new do |s|
  s.name = 'screen-object'
  s.version = ScreenObject::VERSION
  s.authors = ['Dext', 'Ivo Dimitrov']
  s.email = ['qa-automation@dext.com']

  s.summary = 'Screen Object DSL for testing mobile application'
  s.description = 'Implements Page Object pattern'
  s.homepage = 'https://github.com/dext/screen-object'
  s.required_ruby_version = '>= 2.7.2'
  s.platform = Gem::Platform::RUBY

  s.metadata['allowed_push_host'] = 'https://github.com/dext/screen-object'
  s.metadata['rubygems_mfa_required'] = 'true'

  s.license = 'APACHE 2.0'

  s.files = `git ls-files`.split "\n"
  s.executables = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_runtime_dependency 'appium_lib', '~> 12.0.1'
  s.add_runtime_dependency 'childprocess', '~> 4.1.0'
  s.add_runtime_dependency 'page_navigation', '~> 0.10'

  s.add_development_dependency 'pry', '~> 0.14.1'
  s.add_development_dependency 'rake', '~> 13.0.6'
  s.add_development_dependency 'rspec', '~> 3.11.0', '>= 3.1.0'
  s.add_development_dependency 'rspec-expectations', '~> 3.11.0'
  s.add_development_dependency 'rubocop', '~> 1.30.1'
  s.add_development_dependency 'rubocop-faker', '~> 1.1.0'
  s.add_development_dependency 'rubocop-rspec', '~> 2.11.1'
end
