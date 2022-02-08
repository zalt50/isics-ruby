require 'bundler/gem_tasks'
require 'rake/extensiontask'
require 'rake/testtask'

Rake::ExtensionTask.new 'isics' do |ext|
  ext.lib_dir = 'lib/isics'
end

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
end

task :default => :test
