FactoryBot.define do
  factory :product do
    name { 'ケーキ' }
    description { 'ナガノケーキ' }
    price { 1000 }
    is_valid { true }
  end
end
