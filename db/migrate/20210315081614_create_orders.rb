class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :order_status
      t.integer :total_price
      t.string :postcode
      t.string :address
      t.string :address_name
      t.integer :payment_selection
      t.integer :postage

      t.timestamps
    end
  end
end
