class Admin::HomesController < ApplicationController
  def top
    case params[:index_sort]
    when "0"
      @customer = Customer.find(params[:customer_id])
      @orders = @customer.orders.page(params[:page])
    else
      @orders = Order.all.order(created_at: :desc).page(params[:page])
    end
  end
end
