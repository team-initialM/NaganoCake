class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :genre_id, null: false
      t.string :name, null: false
      t.text :description, null: false
      t.integer :price, null: false
      t.boolean :is_valid, null: false, default: true
      t.string :product_image_id
      
      t.timestamps
    end
    add_foreign_key :products, :genres
  end
end
