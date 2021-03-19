class OrderProduct < ApplicationRecord
  belongs_to :product
  belongs_to :order

  enum production_status: { 制作不可: 0, 制作待ち: 1, 製作中: 2, 制作完了: 3 }

  # def order_status(production_status)
  #   if production_status.all? { |order_product| order_product = "制作完了" }
  #     Order.order_status == 3
  #   end
  # end
end
