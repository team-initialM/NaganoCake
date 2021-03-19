class OrderProduct < ApplicationRecord
  belongs_to :product
  belongs_to :order

  enum production_status: { 制作不可: 0, 制作待ち: 1, 製作中: 2, 制作完了: 3 }
end
