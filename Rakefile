# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

GoodTunes::Application.load_tasks

desc 'This rebuilds development db'
task :rebuild do
  puts "dropping db..."
  Rake::Task["db:drop"].invoke
  puts "migrating db..."
  Rake::Task["db:migrate"].invoke
  puts "seeding db..."
  Rake::Task["db:seed"].invoke
  puts "done!"
end