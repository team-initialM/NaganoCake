class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = 'products updated successfully.'
      redirect_to admin_product_path(@product)
    else
      render :edit
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = 'products created successfully.'
      redirect_to admin_product_path(@product)
    else
      render :new
    end
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:genre_id, :name, :description, :price, :is_valid, :product_image)
  end
end
