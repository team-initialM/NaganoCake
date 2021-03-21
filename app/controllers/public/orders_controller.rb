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
      flash[:notice] = "更新ボタンが押されたたか入力エラーが発生したため、入力ページにリダイレクトされました。"
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

    case params[:address]
    when "customer_address"
      @order.postcode = @customer.postcode
      @order.address = @customer.address
      @order.address_name = @customer.firstname + @customer.lastname

    when "existing_shipping_address"
      binding.pry
      @order.postcode = @address.postcode
      @order.address = @address.address
      @order.address_name = @address.address_name

    when "add_shipping_address"
      if params[:shipping_address][:address].present? || params[:shipping_address][:address_name].present? || params[:shipping_address][:postcode].present?
        @add_shipping_address = ShippingAddress.new
        @add_shipping_address.customer_id = @customer.id
        @add_shipping_address.address = params[:shipping_address][:address]
        @add_shipping_address.address_name = params[:shipping_address][:address_name]
        @add_shipping_address.postcode = params[:shipping_address][:postcode]
        @add_shipping_address.save
        @order.postcode = params[:shipping_address][:postcode]
        @order.address = params[:shipping_address][:address]
        @order.address_name = params[:shipping_address][:address_name]
      else
        redirect_to confirm_orders_path
      end
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
