FactoryBot.define do
  factory :buy_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '栃木市' }
    house_number { '14' }
    building_name { '東京ハイツ' }
    phone_number { '09012345678' }
  end
end
