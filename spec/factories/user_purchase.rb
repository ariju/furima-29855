FactoryBot.define do
  factory :user_purchase do
    token { 'tok_abcdefghijk00000000000000000' }
    post_code { '123-4567' }
    municipality { '横浜市' }
    address { '青山1-1-1' }
    phone_number { '09012345678' }
    shipping_area_id { 2 }
    association :user
    association :item
  end
end
