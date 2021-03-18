class Public::OrdersController < ApplicationController
  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
    @order_products.each do |order_product|
      @order_total += order_product.product_price * order_product.quantity
    end
  end

  def new
    @addresses = current_customer.shipping_addresses
    @cart_products = CartProduct.where(customer_id: current_customer.id)
    @order = Order.new
  end

  def create
    @cart = Cart.where(customer_id: current_customer.id)
    if @order.save
      @cart.destroy_all
      redirect_to complete_orders_path
    else
      render :new
    end
  end

  def confirm
    @order = Order.new(order_params)
    @cart_products = CartProduct.where(customer_id: current_customer.id)
    if params[:order][:address_option] == "0"
      @order.postcode = current_customer.postcode
    elsif params[:order][:address_option] == "1"
      @order.postcode = current_customer.postcode
    elsif params[:order][:address_option] == "2"
      @order.postcode = params[:order][:postcode]
      @order.address = params[:order][:address]
      @order.address_name = params[:order][:address_name]
    end
    @cart_products.each do |cart_product|
      @cart_total = 1 * cart_product.quantity
    end
    @order.total_price =(@cart_total + @order.postage).to_i
  end

  def complete
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :order_status, :total_price, :postcode, :address, :address_name, :payment_selection, :postage)
  end
end
