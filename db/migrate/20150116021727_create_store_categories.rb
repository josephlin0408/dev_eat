class CreateStoreCategories < ActiveRecord::Migration
  def change
    create_table :store_categories do |t|
    	t.integer :store_id
      t.string :title
      t.string :anchor

      t.timestamps null: false
    end
  end
end
