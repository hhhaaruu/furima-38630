FactoryBot.define do
  factory :buy_address do
    postal_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    address { '1-1' }
    building { '東京ハイツ' }
    phone_number { '08012345678' }
    token { '1234567' }
  end
end
