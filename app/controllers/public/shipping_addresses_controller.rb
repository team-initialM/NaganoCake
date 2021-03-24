class Public::ShippingAddressesController < ApplicationController
  def index
    @shipping_addresses = ShippingAddress.where(customer_id: current_customer.id)
    @shipping_address = ShippingAddress.new
  end

  def edit
    @shipping_address = ShippingAddress.find(params[:id])
    unless @shipping_address.customer == current_customer
      render :index
    end
  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    @shipping_address.customer_id = current_customer.id
    # respond_to do |format|
      if @shipping_address.save
        # format.html { redierct_to :shipping_addresses_path }
        # format.json (flash[:notice] = "配送先の登録が完了しました。")
      else
        @shipping_addresses = ShippingAddress.where(customer_id: current_customer.id)
        render :index
      end
    # end
  end

  def update
    @shipping_address = ShippingAddress.find(params[:id])
    if @shipping_address.update(shipping_address_params)
      redirect_to shipping_addresses_path
      flash[:notice] = "配送先の編集が完了しました。"
    else
      render :edit
    end
  end

  def destroy
    @shipping_address = ShippingAddress.find(params[:id])
    @shipping_address.destroy
    # redirect_to shipping_addresses_path
    # respond_to do |format|
      # format.json ( flash[:notice] = "配送先の削除が完了しました。")
    # end
  end

  private
  def shipping_address_params
    params.require(:shipping_address).permit(:postcode, :address, :address_name)
  end
end
