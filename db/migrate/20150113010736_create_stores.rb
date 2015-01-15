class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :owner_user
      t.string :address
      t.integer :zip
      t.string :tel
      t.string :power

      t.timestamps null: false
    end
  end
end
