class CreateAdminCatalogs < ActiveRecord::Migration
  def change
    create_table :admin_catalogs do |t|

      t.timestamps
    end
  end
end
