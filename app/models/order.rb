class Order < ApplicationRecord
  has_many :order_products, dependent: :destroy
  belongs_to :customer
  
  def subtotal
    include_tax(self.product.price) * self.quantity
  end
  
  def fullname
    self.firstname + self.lastname
  end
  
end
