require 'rails/generators'
require 'rails/generators/active_record'

module SimpleLocalizer
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path('../templates', __FILE__)
      argument :model_name, :type => :string
      argument :fields, :type => :hash

      def create_migration_file
        migration_template(
          "create_translations.rb",
          "db/migrate/create_#{model_name.underscore.gsub("/", "_")}_translations.rb",
        )
      end

      private

      def self.next_migration_number(dirname)
        ::ActiveRecord::Generators::Base.next_migration_number(dirname)
      end
    end
  end
end
