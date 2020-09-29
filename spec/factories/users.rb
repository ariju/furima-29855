FactoryBot.define do
  factory :user do
    nickname { 'あ' }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { 'あア嗚' }
    first_name_kana       { 'カタカナ' }
    last_name             { 'あア嗚' }
    last_name_kana        { 'カタカナ' }
    birthday              { '1930-01-01' }
  end
end
