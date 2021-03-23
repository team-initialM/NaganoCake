FactoryBot.define do
  factory :customer do
    firstname { '令和' }
    lastname { '道子' }
    kana_firstname { 'レイワ' }
    kana_lastname { 'ミチコ' }
    sequence(:email) { |n| "sample#{n}@example.com" }
    password { 'hogehoge' }
    postcode { '1110000' }
    address { '東京都hoge区' }
    phone_number { '0011112222' }
    is_valid { true }
  end
end