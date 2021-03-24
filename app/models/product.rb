class Product < ApplicationRecord
  belongs_to :genre
  has_many :order_products
  has_many :cart_products, dependent: :destroy

  attachment :product_image

  validates :genre, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :is_valid, inclusion: { in: [true, false] }

  def self.looks(searches, words)
    @products = Product.where(['name LIKE ?', "%#{words}%"])
  end
end
