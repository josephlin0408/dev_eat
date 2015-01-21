class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :user_id
      t.string :address
      t.integer :zip
      t.string :tel
      t.integer :power_cd
      t.integer :status_cd

      t.timestamps null: false
    end
  end
end
