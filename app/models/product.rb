class Product < ApplicationRecord
  belongs_to :genre
  has_many :order_products
  has_many :cart_products, dependent: :destroy

  attachment :product_image
end
