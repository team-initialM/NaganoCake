class Public::OrdersController < ApplicationController

  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def show
    unless params[:id] == "confirm"
      @order = Order.find(params[:id])
      @order_products = @order.order_products
      order_total(@order_products)
    else
      redirect_to request.referer
      flash[:notice] = "更新ボタンが押されたため一つ前のページに戻りました。"
    end
  end

  def new
    @addresses = current_customer.shipping_addresses
    @cart_products = CartProduct.where(customer_id: current_customer.id)
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @add_shipping_address = ShippingAddress.new(customer_id: current_customer.id)
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
    @customer = current_customer

    if params[:address] == "customer_address"
      @order.postcode = @customer.postcode
      @order.address = @customer.address
      @order.address_name = @customer.firstname + @customer.lastname

    elsif params[:address] == "existing_shipping_address"
      @order.postcode = params[:order][:postcode]
      @order.address = params[:order][:address]
      @order.address_name = params[:order][:address_name]

    elsif params[:address] == "add_shipping_address"
      @add_shipping_address = ShippingAddress.new
      @add_shipping_address.customer_id = @customer.id
      @add_shipping_address.address = params[:shipping_address][:address]
      @add_shipping_address.address_name = params[:shipping_address][:address_name]
      @add_shipping_address.postcode = params[:shipping_address][:postcode]
      @add_shipping_address.save

      @order.postcode = params[:shipping_address][:postcode]
      @order.address = params[:shipping_address][:address]
      @order.address_name = params[:shipping_address][:address_name]
    end
    total(@cart_products)
    @order.total_price = @total_price.to_i + @order.postage.to_i
  end

  def complete
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :order_status, :total_price, :postcode, :address, :address_name, :payment_selection, :postage)
  end

end
