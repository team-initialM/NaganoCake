class CartProduct < ApplicationRecord
  belongs_to :customer
  belongs_to :product

  validates :product, presence: true
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :customer, presence: true
end
