# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "simple_localizer"
  s.version = "0.0.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["vad4msiu"]
  s.date = "2013-01-29"
  s.description = "Simple localization your ActiveRecord fields without magic"
  s.email = "vad4msiu@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "lib/generators/simple_localizer/create_migration_generator.rb",
    "lib/generators/simple_localizer/templates/create_translations.rb",
    "lib/simple_localizer.rb",
    "simple_localizer.gemspec",
    "spec/dummy/.gitignore",
    "spec/dummy/Gemfile",
    "spec/dummy/Gemfile.lock",
    "spec/dummy/README.rdoc",
    "spec/dummy/Rakefile",
    "spec/dummy/app/assets/images/rails.png",
    "spec/dummy/app/assets/javascripts/application.js",
    "spec/dummy/app/assets/stylesheets/application.css",
    "spec/dummy/app/controllers/application_controller.rb",
    "spec/dummy/app/helpers/application_helper.rb",
    "spec/dummy/app/mailers/.gitkeep",
    "spec/dummy/app/models/admin.rb",
    "spec/dummy/app/models/admin/catalog.rb",
    "spec/dummy/app/models/food.rb",
    "spec/dummy/app/models/food/restaurant.rb",
    "spec/dummy/app/models/legacy.rb",
    "spec/dummy/app/models/legacy/service.rb",
    "spec/dummy/app/models/product.rb",
    "spec/dummy/app/views/layouts/application.html.erb",
    "spec/dummy/config.ru",
    "spec/dummy/config/application.rb",
    "spec/dummy/config/boot.rb",
    "spec/dummy/config/database.yml",
    "spec/dummy/config/environment.rb",
    "spec/dummy/config/environments/development.rb",
    "spec/dummy/config/environments/production.rb",
    "spec/dummy/config/environments/test.rb",
    "spec/dummy/config/initializers/backtrace_silencers.rb",
    "spec/dummy/config/initializers/inflections.rb",
    "spec/dummy/config/initializers/mime_types.rb",
    "spec/dummy/config/initializers/secret_token.rb",
    "spec/dummy/config/initializers/session_store.rb",
    "spec/dummy/config/initializers/wrap_parameters.rb",
    "spec/dummy/config/locales/en.yml",
    "spec/dummy/config/routes.rb",
    "spec/dummy/db/migrate/20130123145651_create_admin_catalogs.rb",
    "spec/dummy/db/migrate/20130123151746_create_food_restaurants.rb",
    "spec/dummy/db/migrate/20130123151803_create_legacy_services.rb",
    "spec/dummy/db/migrate/20130123151814_create_products.rb",
    "spec/dummy/db/migrate/20130123200420_create_admin_catalog_translations.rb",
    "spec/dummy/db/migrate/20130123200525_create_food_restaurant_translations.rb",
    "spec/dummy/db/migrate/20130123200536_create_legacy_service_translations.rb",
    "spec/dummy/db/migrate/20130123200543_create_product_translations.rb",
    "spec/dummy/db/schema.rb",
    "spec/dummy/db/seeds.rb",
    "spec/dummy/lib/assets/.gitkeep",
    "spec/dummy/lib/tasks/.gitkeep",
    "spec/dummy/log/.gitkeep",
    "spec/dummy/public/404.html",
    "spec/dummy/public/422.html",
    "spec/dummy/public/500.html",
    "spec/dummy/public/favicon.ico",
    "spec/dummy/public/index.html",
    "spec/dummy/public/robots.txt",
    "spec/dummy/script/rails",
    "spec/dummy/test/fixtures/.gitkeep",
    "spec/dummy/test/fixtures/admin/catalogs.yml",
    "spec/dummy/test/fixtures/food/restaurants.yml",
    "spec/dummy/test/fixtures/legacy/services.yml",
    "spec/dummy/test/fixtures/products.yml",
    "spec/dummy/test/functional/.gitkeep",
    "spec/dummy/test/integration/.gitkeep",
    "spec/dummy/test/performance/browsing_test.rb",
    "spec/dummy/test/test_helper.rb",
    "spec/dummy/test/unit/.gitkeep",
    "spec/dummy/test/unit/admin/catalog_test.rb",
    "spec/dummy/test/unit/food/restaurant_test.rb",
    "spec/dummy/test/unit/legacy/service_test.rb",
    "spec/dummy/test/unit/product_test.rb",
    "spec/dummy/vendor/assets/javascripts/.gitkeep",
    "spec/dummy/vendor/assets/stylesheets/.gitkeep",
    "spec/dummy/vendor/plugins/.gitkeep",
    "spec/simple_localizer_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = "https://github.com/vad4msiu/simple_localizer.git"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.17"
  s.summary = "Simple localization your ActiveRecord fields without magic"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.8.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.7"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.4"])
      s.add_development_dependency(%q<database_cleaner>, [">= 0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<rails>, ["~> 4.0"])
      s.add_dependency(%q<rack>, [">= 0"])
    else
      s.add_dependency(%q<activerecord>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.8.0"])
      s.add_dependency(%q<bundler>, ["~> 1.7"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.4"])
      s.add_dependency(%q<database_cleaner>, [">= 0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<rails>, ["~> 4.0"])
      s.add_dependency(%q<rack>, [">= 0"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.8.0"])
    s.add_dependency(%q<bundler>, ["~> 1.7"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.4"])
    s.add_dependency(%q<database_cleaner>, [">= 0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<rails>, ["~> 4.0"])
    s.add_dependency(%q<rack>, [">= 0"])
  end
end
