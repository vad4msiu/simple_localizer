module SimpleLocalizer
  module Generators
    class CreateMigrationGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path('../templates', __FILE__)
      argument :model_name, :type => :string
      argument :fields, :type => :hash

      def self.next_migration_number(dirname, count = 0)
        if count == 0
          name = Time.now.strftime("%Y%m%d%H%M%S")
        else
          name = (Time.now + count).strftime("%Y%m%d%H%M%S")
        end

        if Dir[File.join(dirname, name + '*')].empty?
          name
        else
          next_migration_number(dirname, count + 1)
        end
      end

      def create_migration
        migration_template(
          "create_translations.rb",
          "db/migrate/create_#{model_name.underscore.gsub("/", "_")}_translations",
        )
      end
    end
  end
end