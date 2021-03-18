class Order < ApplicationRecord
  has_many :order_products, dependent: :destroy
  belongs_to :customer
  
  def fullname
    self.firstname + self.lastname
  end
  
end
