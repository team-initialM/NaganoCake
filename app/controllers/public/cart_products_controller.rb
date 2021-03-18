class Public::CartProductsController < ApplicationController
  def index
    @cart_products = CartProduct.where(customer_id: current_customer.id)
  end

  def create
    @cart_product = current_customer.cart_products.create(cart_products_params)
    @cart_product.save
    redirect_to cart_products_path
  end

  def update
    @cart_product = CartProduct.find(params[:id])
    if @cart_product.update(cart_products_params)
      redirect_to cart_products_path
      flash[:notice] = "The quantity of selected items has changed."
    end
  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    redirect_to cart_products_path
    flash[:notice] = "The selected item has been removed from the cart."
  end

  def destroy_all
    @cart_products = Cart.where(customer_id: current_customer.id)
    @cart_products.destroy
    redirect_to cart_products_path
    flash[:notice] = "All selected items has been removed from the cart."
  end

  private
    def cart_products_params
      params.require(:cart_product).permit(:product_id, :quantity)
    end
end
