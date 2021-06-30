FactoryBot.define do
  factory :order_address do
    postal_code {'123-4567'}
    prefecture {1}
    municipalities {'東京都'}
    building {'東京ハイツ'}
    address {'1-1'}
    phone_number {123456789101}
  end
end