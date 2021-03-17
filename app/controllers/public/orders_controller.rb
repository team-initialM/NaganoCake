class Public::OrdersController < ApplicationController
  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
    @order_products.each do |order_product|
      @product_total += order_product.product_price * order_product.quantity
    end
  end
  
  def new
  end
  
  def create
  end
  
  def confirm
  end

  def complete
  end
end
