class CreateFoodRestaurantTranslations < ActiveRecord::Migration
  def change
    create_table :food_restaurant_translations do |t|
      t.string :locale, :null => false
      t.integer :food_restaurant_id      
      t.string :name      

      t.timestamps
    end

    add_index :food_restaurant_translations, :food_restaurant_id, {}
    add_index :food_restaurant_translations, :locale, {}
    add_index :food_restaurant_translations, [:locale, :food_restaurant_id], {:name=>"nqeqdgkmyeuwwgwyxdui", :unique=>true}
  end
end