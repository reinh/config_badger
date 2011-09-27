# encoding: utf-8

require "bundler/gem_tasks"

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
  spec.rspec_opts = ['-cfs']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

task :rdoc do
  abort 'bin/rdoc not found. Please run `bundle --binstubs`' unless File.exists?('bin/rdoc')
  sh 'bin/rdoc -q -U --main=README.rdoc -f hanna --markup tomdoc README.rdoc LICENSE lib'
end
