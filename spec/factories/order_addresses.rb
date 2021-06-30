FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture { 1 }
    municipalities { '東京都' }
    building { '東京ハイツ' }
    address { '11-1' }
    phone_number { 15_044_444_444 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
