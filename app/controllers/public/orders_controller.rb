class Public::OrdersController < ApplicationController

  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
    total(@order_products)
    # @select_products_price = subtotal(@order.order_products)
    # @total_price = @select_products_price.sum(:product_price)
    # # @order.total_product_price(@order.order_products, @product_price_total)
    # @order_products.each do |order_product|
    #   @order_total = @order_total.to_i + order_product.product_price * order_product.quantity
    # end
  end

  def new
    @addresses = current_customer.shipping_addresses
    @cart_products = CartProduct.where(customer_id: current_customer.id)
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @cart_products = CartProduct.where(customer_id: current_customer.id)
    if @order.save
      @order.move_products(@cart_products)
      @cart_products.destroy_all
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
      @order.address = params[:order][:address]
      @order.address_name = params[:order][:address_name]
    elsif params[:order][:address_option] == "1"
      @order.postcode = current_customer.postcode
      @order.address = params[:order][:address]
      @order.address_name = params[:order][:address_name]
    elsif params[:order][:address_option] == "2"
      @order.postcode = params[:order][:postcode]
      @order.address = params[:order][:address]
      @order.address_name = params[:order][:address_name]
    end
    @cart_products.each do |cart_product|
      @tax_price = include_tax(cart_product.product.price)
      @cart_total = @cart_total.to_i + @tax_price * cart_product.quantity
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
