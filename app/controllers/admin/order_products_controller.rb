class Admin::OrderProductsController < ApplicationController
  def update
    @order = Order.find(params[:id])
    @order_product = OrderProduct.find(params[:order_product][:order_product_id])
    if @order_product.update(order_product_params)
      flash[:notice] = 'production_status updated successfully.'
      redirect_to admin_order_path(@order)
    else
      render admin_order_path(@order)
    end
    @order_products = OrderProduct.where(order_id: @order.id)
    if @order_products.all? { |order_product| order_product.production_status_before_type_cast == 3 }
      @order.update(order_status: "発送準備中")
    end
  end

  private

  def order_product_params
    params.require(:order_product).permit(:production_status)
  end
end
