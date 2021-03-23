FactoryBot.define do
  factory :order_product do
    quantity { 1 }
    product_price { 1100 }
    production_status { 0 }
  end
end
