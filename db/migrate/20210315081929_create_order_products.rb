class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.integer :order_id, null: false
      t.integer :product_id, null: false
      t.integer :quantity, null: false
      t.integer :product_price, null: false
      t.integer :production_status, null: false, default: 0
      
      t.timestamps
    end
    add_foreign_key :order_products, :orders
    add_foreign_key :order_products, :products
  end
end
