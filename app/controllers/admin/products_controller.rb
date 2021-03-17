class Admin::ProductsController < ApplicationController
  def index
  end

  def show
    @product = Product.find(params[:id])
  end

  def update
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
  end

  private

  def product_params
    params.require(:product).permit(:genre_id, :name, :description, :price, :is_valid, :product_image)
  end
end
