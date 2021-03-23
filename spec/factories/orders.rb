FactoryBot.define do
  factory :order do
    order_status { 0 }
    total_price { 2000 }
    postcode { '2221111' }
    address { '北海道札幌市' }
    address_name { '山田花子' }
    payment_selection { 0 }
    postage { 800 }
  end
end
