require 'rubygems'
require 'rake'

begin
  gem 'rspec', '~> 2.0'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new
rescue LoadError => e
  task :spec do
    abort "Please run `gem install rspec` to install RSpec."
  end
end
task :test => :spec
task :default => :spec

begin
  gem 'yard', '~> 0.7'
  require 'yard'

  YARD::Rake::YardocTask.new  
rescue LoadError => e
  task :yard do
    abort "Please run `gem install yard` to install YARD."
  end
end
