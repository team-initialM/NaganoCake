module Public::CartProductsHelper
  def total_product_price(cart_product)
    include_tax(cart_product.product.price) * (cart_product.quantity)
  end
end
