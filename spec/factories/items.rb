FactoryBot.define do
  factory :item do
    product_name { 'test' }
    product_explanation { 'test' }
    product_category_id { 2 }
    product_status_id { 2 }
    prefecture_id { 2 }
    deliver_fee_payment_id { 2 }
    price { 1000 }
    deliver_day_id { 2 }
    association :user

    after(:build) do |image|
      image.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
