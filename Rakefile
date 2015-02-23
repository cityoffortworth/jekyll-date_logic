require 'bundler/gem_tasks'

desc 'Run tests'
task :test do
  test_file = File.join('test', 'jekyll', 'date_logic_test.rb')
  system "ruby -Ilib #{test_file}"
end

task :default => :test
