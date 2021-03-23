class OrderProduct < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :product_price, presence: true, numericality: { greater_than: 0 }
  validates :production_status, presence: true
  validates :product, presence: true
  validates :order, presence: true

  enum production_status: { 製作不可: 0, 製作待ち: 1, 製作中: 2, 製作完了: 3 }
end
