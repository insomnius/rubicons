require 'rake'
require 'rake/testtask'

# Define a task for running tests
Rake::TestTask.new do |t|
  t.libs << 'test'
  t.pattern = 'spec/**/*_spec.rb'
end

# Define a task for building the gem
task :build do
  sh 'gem build rubicons.gemspec'
end

# Define a task for installing the gem
task :install do
  sh 'gem install rubicons-*.gem'
end

# Define a task for cleaning up generated files
task :clean do
  rm_rf Dir['*.gem']
end

# Define the default task
task default: [:test, :build]