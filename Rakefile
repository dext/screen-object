require 'rubygems'
require 'bundler'
require 'rspec/core/rake_task'

Bundler::GemHelper.install_tasks

task :spec
RSpec::Core::RakeTask.new :spec do |spec|
  spec.ruby_opts = '-I lib:spec'
  spec.pattern = 'spec/lib/*_spec.rb'
end

desc 'Run integration examples'
task :integration
RSpec::Core::RakeTask.new :integration do |spec|
  spec.ruby_opts = '-I lib:spec'
  spec.pattern = 'spec/integration/*_spec.rb'
end

desc 'Run screen object examples'
task :screen_object
RSpec::Core::RakeTask.new :screen_object do |spec|
  spec.ruby_opts = '-I lib:spec'
  spec.pattern = 'spec/screen-object/*_spec.rb'
end

desc 'Executes all examples'
task :all_examples do
  exec 'bundle exec rspec spec/.'
end
