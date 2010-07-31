require 'rubygems'
require 'rake'
require 'rake/extensiontask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "distance_measures"
    gem.summary = %Q{A bundle of distance measures with C extensions for the slow bits}
    gem.description = %Q{A bundle of distance measures with C extensions for the slow bits}
    gem.email = "reddavis@gmail.com"
    gem.homepage = "http://github.com/reddavis/distance_measure"
    gem.authors = ["reddavis"]
    gem.add_development_dependency "rspec", ">= 1.2.9"
    gem.extensions = FileList['ext/**/extconf.rb']
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

# Euclidean Distance
Rake::ExtensionTask.new('euclidean_distance') do |ext|
  ext.lib_dir = File.join('lib', 'distance_measures')
end

# Core
Rake::ExtensionTask.new('core') do |ext|
  ext.lib_dir = File.join('lib', 'distance_measures')
end

task :spec => :check_dependencies
task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "distance_measure #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

Rake::Task[:spec].prerequisites << :compile