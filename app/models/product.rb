class Product < ApplicationRecord
  belongs_to :genre
  has_many :order_products
  has_many :cart_products, dependent: :destroy

  attachment :product_image

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: true
  validates :is_valid, inclusion: { in: [true, false] }
end
