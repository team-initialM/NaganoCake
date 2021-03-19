module Admin::HomesHelper

  def order_products_quantity(order)
    OrderProduct.where(order_id: order.id).sum(:quantity)
  end
end
