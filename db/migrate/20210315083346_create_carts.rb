class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.integer :product_id, null: false
      t.integer :customer_id, null: false
      t.integer :quantity, null: false
      
      t.timestamps
    end
    add_foreign_key :carts, :products
    add_foreign_key :carts, :customers
  end
end
