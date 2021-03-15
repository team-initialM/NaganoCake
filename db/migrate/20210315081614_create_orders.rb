class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.integer :order_status, null: false, default: 0
      t.integer :total_price, null: false
      t.string :postcode, null: false
      t.string :address, null: false
      t.string :address_name, null: false
      t.integer :payment_selection, null: false, default: 0
      t.integer :postage, null: false

      t.timestamps
    end
  end
end
