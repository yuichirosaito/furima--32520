FactoryBot.define do
  factory :item do
    name { '写真' }
    explaination { '写真' }
    category_id { 2 }
    status_id { 2 }
    price { 1000 }
    delivery_fee_id { 2 }
    delivery_area_id { 2 }
    delivery_span_id { 2 }
    image { Faker::Lorem.sentence }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
