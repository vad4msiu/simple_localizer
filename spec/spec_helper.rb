$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'simple_localizer'
require 'database_cleaner'
require 'logger'
require 'pp'

config = YAML.load_file File.expand_path(File.join(File.dirname(__FILE__), 'database.yml'))
ActiveRecord::Base.establish_connection config

I18n.default_locale = :ru
I18n.locale         = :en

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end