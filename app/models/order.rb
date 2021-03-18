class Order < ApplicationRecord
  has_many :order_products, dependent: :destroy
  belongs_to :customer
  
  def subtotal
    include_tax(self.product.price) * self.quantity
  end
  
  def fullname
    self.firstname + self.lastname
  end
  
  def registred_address
    self.postcode + self.address + self.address_name
  end
  
end
