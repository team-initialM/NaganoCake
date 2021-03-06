class Public::CartProductsController < ApplicationController
  before_action :authenticate_customer!, except:[:create]

  def index
    @cart_products = CartProduct.where(customer_id: current_customer.id)
  end

  def create
    if customer_signed_in?
      @cart_product = current_customer.cart_products.build(cart_product_params)
      @cart_products = current_customer.cart_products
      unless @cart_product.quantity == nil
        if @cart_products.exists?(product_id: @cart_product.product_id)
          cart_product = CartProduct.find_by(product_id: @cart_product.product_id)
          new_quantity = cart_product.quantity + @cart_product.quantity
          cart_product.update_attribute(:quantity, new_quantity)
       　 @cart_product.delete
        end
        @cart_product.save
        redirect_to cart_products_path
      else
        redirect_to request.referer
        flash[:notice] = "Please select the number of products."
      end
    else
      redirect_to customer_session_path
      flash[:notice] = "Please log in before inserting it into your cart."
    end
  end

  def update
    @cart_product = CartProduct.find(params[:id])
    @cart_products = CartProduct.where(customer_id: current_customer.id)
    respond_to do |format|
      if @cart_product.update(cart_product_params)
        format.js { flash[:notice] = "The quantity of selected items has changed." }
      end
    end
  end

  def destroy
    @cart_products = CartProduct.where(customer_id: current_customer.id)
    @cart_product = CartProduct.find(params[:id])
    respond_to do |format|
      if @cart_product.destroy
        format.js { flash[:notice] = "The selected item has been removed from the cart." }
      end
    end
  end

  def destroy_all
    @cart_products = CartProduct.where(customer_id: current_customer.id)
    respond_to do |format|
      if @cart_products.destroy_all
        format.js { flash[:notice] = "All selected items has been removed from the cart." }
      end
    end
  end

  private

  def cart_product_params
    params.require(:cart_product).permit(:product_id, :quantity)
  end
end
