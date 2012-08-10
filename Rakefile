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

task :default => :spec

namespace :db do
  require 'active_record'

  config = YAML.load_file File.expand_path(File.join(File.dirname(__FILE__), 'spec', 'database.yml'))
  ActiveRecord::Base.establish_connection(config.merge('schema_search_path' => 'public'))

  desc 'Run migrations'
  task :migrate do
    ActiveRecord::Migration.create_table :products do |t|
      t.timestamps
    end

    ActiveRecord::Migration.create_table :product_translations do |t|
      t.string :locale
      t.string :name
      t.integer :product_id
      t.timestamps
    end
  end
end