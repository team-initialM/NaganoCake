class Admin::SearchController < ApplicationController
  def index

    @range = params[:range]
    if @range == "Customer"
      @customers = Customer.looks(params[:search], params[:word]).page(params[:page]).per(10)
    else
      @products = Product.looks(params[:search], params[:word]).page(params[:page]).per(10)
    end
  end
end
