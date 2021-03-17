class Public::CustomersController < ApplicationController
  def show
  end

  def edit
  end

  def update
    current_customer.update(customer_params)
    redirect_to show_customers_path
  end

  def unsubclibe
  end

  def withdraw
    current_customer.update(customer_params)
    redirect_to show_customers_path
  end

  private
  def customer_params
    params.require(:customer).permit(:firstname, :lastname, :kana_firstname, :kana_lastname, :postcode, :address, :phone_number, :email, :is_valid)
  end

end
