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
      redirect_back(fallback_location: root_path)
      flash[:notice] = "更新ボタンが押されたたか入力エラーが発生したため、入力ページにリダイレクトされました。"
    end
  end

  def new
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
      order_address = ShippingAddress.find(params[:order][:id])
      @order.postcode = order_address.postcode
      @order.address = order_address.address
      @order.address_name = order_address.address_name

    when "add_shipping_address"
      @add_shipping_address = ShippingAddress.new(shipping_address_params)
      @add_shipping_address.customer_id = @customer.id
      if  @add_shipping_address.save
        @order.postcode = @add_shipping_address.postcode
        @order.address = @add_shipping_address.address
        @order.address_name = @add_shipping_address.address_name
      else
        flash[:notice] = "更新ボタンが押されたたか入力エラーが発生したため、入力ページにリダイレクトされました。"
        redirect_back(fallback_location: root_path)
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

  def shipping_address_params
    params.require(:shipping_address).permit(:postcode, :address, :address_name)
  end
end
