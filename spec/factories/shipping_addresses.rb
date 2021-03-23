FactoryBot.define do
  factory :shipping_address do
    postcode { '1110000' }
    address { '大阪府大阪市北区' }
    address_name { '梅田太郎' }
  end
end
