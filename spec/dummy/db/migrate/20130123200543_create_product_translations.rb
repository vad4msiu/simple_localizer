class CreateProductTranslations < ActiveRecord::Migration
  def change
    create_table :product_translations do |t|
      t.string :locale, :null => false
      t.integer :product_id
      t.string :name
      t.string :description

      t.timestamps
    end

    add_index :product_translations, :product_id, {}
    add_index :product_translations, :locale, {}
    add_index :product_translations, [:locale, :product_id], {:unique=>true}
  end
end