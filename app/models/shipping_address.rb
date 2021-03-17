class ShippingAddress < ApplicationRecord
  belongs_to :customer
  
  validates :postcode, presence: true, length: { is: 7 }
  validates :address, presence: true
  validates :address_name, presence: true
  
end
