class Product < ApplicationRecord
  belongs_to :genre
  has_many :order_products
  has_many :cart_products, dependent: :destroy

  attachment :product_image

  # 商品名と説明文の長さのバリデーションは仮の数値！
  validates :name, presence: true, length: { in: 1..50 }
  validates :description, presence: true, length: { in: 1..100 }
  validates :price, presence: true, numericality: true
  validates :is_valid, inclusion: { in: [true, false] }
end
