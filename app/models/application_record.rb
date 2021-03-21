class ApplicationRecord < ActiveRecord::Base
  include ActionView::Helpers::ApplicationHelper

  self.abstract_class = true

  def fullname
    self.firstname + self.lastname
  end

  def params_registred_address
    "〒" + self.postcode + "  " + self.address + "  " +self.address_name
  end
end
