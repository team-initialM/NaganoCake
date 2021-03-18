module ApplicationHelper
  def include_tax(price)
    tax = 1.1
    ((price * tax).round(2)).ceil
  end
  
  def registred_address(address)
    address.postcode + address.address + address.address_name
  end
  
  def subtotal(order)
    include_tax(order.product.price) * order.quantity
  end
end
