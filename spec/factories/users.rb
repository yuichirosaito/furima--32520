FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) + '1a' }
    password_confirmation { password }
    last_name { '田中' }
    first_name { '田中' }
    last_name_kana { 'タナカ' }
    first_name_kana { 'タナカ' }
    birthday { Faker::Date.between(from: '2014-09-23', to: '2020-09-25') }
  end
end
