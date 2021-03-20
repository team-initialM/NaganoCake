class Public::ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(8).order(id: "DESC")
  end

  def show
    @product = Product.find(params[:id])
    @cart_product = CartProduct.new
  end
end
