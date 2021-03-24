class ApplicationController < ActionController::Base
  include ApplicationHelper

  after_action :discard_flash_if_xhr

  protected
  def after_sign_in_path_for(resource)
    case resource
     when Admin
      admin_path
     when Customer
       if current_customer.is_valid == true
         root_path
       else
         reset_session
         flash[:notice] = "You have already unsubscribed."
         new_customer_session_path
       end
    end
  end

  def after_sign_out_path_for(resource)
    if resource == :admin
      new_admin_session_path
    else
      root_path
    end
  end

  def discard_flash_if_xhr
    flash.discard if request.xhr?
  end
end
