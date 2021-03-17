class Public::OrdersController < ApplicationController
  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
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
