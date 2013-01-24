# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130123200543) do

  create_table "admin_catalog_translations", :force => true do |t|
    t.string   "locale",           :null => false
    t.integer  "admin_catalog_id"
    t.string   "name"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "admin_catalog_translations", ["admin_catalog_id"], :name => "index_admin_catalog_translations_on_admin_catalog_id"
  add_index "admin_catalog_translations", ["locale", "admin_catalog_id"], :name => "zakujogdjaznuhjqdbwz", :unique => true
  add_index "admin_catalog_translations", ["locale"], :name => "index_admin_catalog_translations_on_locale"

  create_table "admin_catalogs", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "food_restaurant_translations", :force => true do |t|
    t.string   "locale",             :null => false
    t.integer  "food_restaurant_id"
    t.string   "name"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "food_restaurant_translations", ["food_restaurant_id"], :name => "index_food_restaurant_translations_on_food_restaurant_id"
  add_index "food_restaurant_translations", ["locale", "food_restaurant_id"], :name => "nqeqdgkmyeuwwgwyxdui", :unique => true
  add_index "food_restaurant_translations", ["locale"], :name => "index_food_restaurant_translations_on_locale"

  create_table "legacy_service_translations", :force => true do |t|
    t.string   "locale",            :null => false
    t.integer  "legacy_service_id"
    t.string   "name"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "legacy_service_translations", ["legacy_service_id"], :name => "index_legacy_service_translations_on_legacy_service_id"
  add_index "legacy_service_translations", ["locale", "legacy_service_id"], :name => "qtyhfsoamlrpjmayrkyp", :unique => true
  add_index "legacy_service_translations", ["locale"], :name => "index_legacy_service_translations_on_locale"

  create_table "product_translations", :force => true do |t|
    t.string   "locale",      :null => false
    t.integer  "product_id"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "product_translations", ["locale", "product_id"], :name => "index_product_translations_on_locale_and_product_id", :unique => true
  add_index "product_translations", ["locale"], :name => "index_product_translations_on_locale"
  add_index "product_translations", ["product_id"], :name => "index_product_translations_on_product_id"

  create_table "products", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "qweqweqwe", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "restaurants", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
