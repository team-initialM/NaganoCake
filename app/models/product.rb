class Product < ApplicationRecord
  belongs_to :genre
  has_many :order_products
  has_many :cart_products, dependent: :destroy

  attachment :product_image

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: true
  validates :is_valid, inclusion: { in: [true, false] }

  def self.looks(searches, words)
    @products = Product.where(['genre_id LIKE ? OR name LIKE ? OR is_valid LIKE ?', "%#{words}%", "%#{words}%", "%#{words}%"])
  end
end
