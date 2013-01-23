class CreateLegacyServiceTranslations < ActiveRecord::Migration
  def change
    create_table :legacy_service_translations do |t|
      t.string :locale, :null => false
      t.integer :legacy_service_id      
      t.string :name      

      t.timestamps
    end

    add_index :legacy_service_translations, :legacy_service_id, {}
    add_index :legacy_service_translations, :locale, {}
    add_index :legacy_service_translations, [:locale, :legacy_service_id], {:name=>"qtyhfsoamlrpjmayrkyp", :unique=>true}
  end
end