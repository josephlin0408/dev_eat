class CreateStoreTakes < ActiveRecord::Migration
  def change
    create_table :store_takes do |t|
      t.integer :user_id
      t.integer :store_id
      t.integer :status

      t.timestamps null: false
    end
  end
end
