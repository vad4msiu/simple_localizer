class CreateAdminCatalogTranslations < ActiveRecord::Migration
  def change
    create_table :admin_catalog_translations do |t|
      t.string :locale, :null => false
      t.integer :admin_catalog_id      
      t.string :name      

      t.timestamps
    end

    add_index :admin_catalog_translations, :admin_catalog_id, {}
    add_index :admin_catalog_translations, :locale, {}
    add_index :admin_catalog_translations, [:locale, :admin_catalog_id], {:name=>"zakujogdjaznuhjqdbwz", :unique=>true}
  end
end