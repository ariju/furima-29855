FactoryBot.define do
  factory :item do
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    price { 300 }
    product_name { 'あああ' }
    product_name_description { 'あああ' }
    burden_of_shipping_charges_id { 2 }
    category_id { 2 }
    days_to_ship_id { 2 }
    product_condition_id { 2 }
    shipping_area_id { 2 }
  end
end
