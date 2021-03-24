class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
  end

  def edit
  end

  def update
    current_customer.update(customer_params)
  end

  def unsubclibe
  end

  def withdraw
    current_customer.update(is_valid: false)
    reset_session
    flash[:notice] = "Thank you. We look forward to your next visit."
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:firstname, :lastname, :kana_firstname, :kana_lastname, :postcode, :address, :phone_number, :email, :is_valid)
  end

end
