class CreateStoreProducts < ActiveRecord::Migration
  def change
    create_table :store_products do |t|
    	t.integer :store_id
      t.string :name
      t.integer :price
      t.text :desc

      t.timestamps null: false
    end
  end
end
