module ApplicationHelper
  def include_tax(price)
    tax = 1.1
    ((price * tax).round(2)).ceil
  end

  def registred_address(address)
    "〒" + address.postcode + "  " + address.address + "  " + address.address_name
  end

  def subtotal(select_product)
    include_tax(select_product.product.price) * select_product.quantity
  end

  def total(select_products)
    @total_price = 0
    select_products.each do |select_product|
      @total_price +=  subtotal(select_product)
    end
    return @total_price
  end

  def order_total(select_products)
    @total_price = 0
    select_products.each do |select_product|
      @total_price += order_subtotal(select_product)
    end
    return @total_price
  end

  def order_subtotal(select_product)
    select_product.product_price * select_product.quantity
  end

end
