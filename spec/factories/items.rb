FactoryBot.define do
  factory :item do
    name                        { 'test' }
    description                 { 'test' }
    category_id                 { 2 }
    product_status_id           { 2 }
    shipping_charges_id         { 2 }
    prefecture_id               { 2 }
    shipping_date_and_time_id   { 2 }
    price                       { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
