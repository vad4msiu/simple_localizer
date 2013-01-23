# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'
require 'rspec/core/rake_task'
require File.expand_path('spec/dummy/config/application', File.dirname(__FILE__))

Dummy::Application.load_tasks


require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name = "simple_localizer"
  gem.homepage = "https://github.com/vad4msiu/simple_localizer.git"
  gem.license = "MIT"
  gem.summary = %Q{Simple localization your ActiveRecord fields without magic}
  gem.description = %Q{Simple localization your ActiveRecord fields without magic}
  gem.email = "vad4msiu@gmail.com"
  gem.authors = ["vad4msiu"]
end
Jeweler::RubygemsDotOrgTasks.new

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

# namespace :db do
#   require 'active_record'

#   config = YAML.load_file File.expand_path(File.join(File.dirname(__FILE__), 'spec', 'database.yml'))
#   ActiveRecord::Base.establish_connection(config.merge('schema_search_path' => 'public'))

#   desc 'Drop database'
#   task :drop do
#     system('rm spec/db/test.sqlite3')
#   end

#   desc 'Drop database and run migrations'
#   task :setup do
#     Rake::Task["db:drop"].invoke
#     Rake::Task["db:migrate"].invoke
#   end

#   desc 'Run migrations'
#   task :migrate do
#     ActiveRecord::Migration.create_table :admin_catalogs do |t|
#       t.timestamps
#     end

#     ActiveRecord::Migration.create_table :admin_catalog_translations do |t|
#       t.string :locale
#       t.string :name
#       t.integer :admin_catalog_id
#       t.timestamps
#     end

#     ActiveRecord::Migration.create_table :restaurants do |t|
#       t.timestamps
#     end

#     ActiveRecord::Migration.create_table :food_restaurant_translations do |t|
#       t.string :locale
#       t.string :name
#       t.integer :food_restaurant_id
#       t.timestamps
#     end

#     ActiveRecord::Migration.create_table :qweqweqwe do |t|
#       t.timestamps
#     end

#     ActiveRecord::Migration.create_table :legacy_service_translations do |t|
#       t.string :locale
#       t.string :name
#       t.integer :legacy_service_id
#       t.timestamps
#     end

#     ActiveRecord::Migration.create_table :products do |t|
#       t.timestamps
#     end

#     ActiveRecord::Migration.create_table :product_translations do |t|
#       t.string :locale
#       t.string :name
#       t.integer :product_id
#       t.timestamps
#     end
#   end
# end