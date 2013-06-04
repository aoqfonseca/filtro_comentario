require 'rubygems'
require 'bundler/setup'

require 'rspec/core/rake_task'
require  'sinatra/activerecord/rake'

desc "Run all spec file"
RSpec::Core::RakeTask.new do |task|
  task.pattern = "./spec/**/*_spec.rb"
  task.rspec_opts = "--fail-fast --format documentation --colour"
end


