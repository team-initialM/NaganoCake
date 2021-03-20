class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer)
    else
      render index
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:firstname, :lastname, :kana_firstname, :kana_lastname, :postcode, :address, :phone_number, :email, :is_valid)
  end

end
