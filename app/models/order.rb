class Order < ApplicationRecord
  has_many :order_products, dependent: :destroy
  belongs_to :customer

  def move_products(cart_products)
    cart_products.each do |cart_product|
      OrderProduct.create(order_id: self.id, product_id: cart_product.product_id, quantity: cart_product.quantity, product_price: include_tax(cart_product.product.price))
    end
  end

  enum order_status: {入金待ち: 0 ,入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4}
  enum payment_selection: {クレジットカード: 0, 銀行振込: 1}
end
