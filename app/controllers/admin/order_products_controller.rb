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
    @order_products.each do |order_product|
      if order_product.production_status == "制作完了"
        @judge = @judge.to_i + 1
      end
      @count = @count.to_i + 1
    end
    if @judge == @count
      @order.update(order_status: "発送準備中")
    end
  end

  private

  def order_product_params
    params.require(:order_product).permit(:production_status)
  end
end
