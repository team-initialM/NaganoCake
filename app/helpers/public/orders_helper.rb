module Public::OrdersHelper
  def order_subtotal(select_product)
    select_product.product_price * select_product.quantity
  end
end
