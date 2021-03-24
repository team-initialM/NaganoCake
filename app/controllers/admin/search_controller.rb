class Admin::SearchController < ApplicationController
  def index

    @range = params[:range]

    case @range
    when "会員情報"
      @customers = Customer.looks(params[:search], params[:word]).page(params[:page]).per(10)
    when "商品名"
      @products = Product.looks(params[:search], params[:word]).page(params[:page]).per(10)
    when "注文者名"
      @orders = Order.looks(params[:search], params[:word]).page(params[:page]).per(10)
    end
  end
end
