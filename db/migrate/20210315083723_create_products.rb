class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :genre_id
      t.string :name
      t.text :description
      t.integer :price
      t.boolean :is_valid
      t.string :product_image_id
      
      t.timestamps
    end
    add_foreign_key :products, :genres
  end
end
