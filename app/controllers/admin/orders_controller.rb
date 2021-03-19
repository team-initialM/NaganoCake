class Admin::OrdersController < ApplicationController
  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:notice] = 'order_status updated successfully.'
      redirect_to admin_order_path(@order)
    else
      render :show
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_products = OrderProduct.where(order_id: @order.id)
    @order_product = OrderProduct.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end
end
