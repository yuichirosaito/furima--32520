FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password+"a"+"1"}
    password_confirmation {password}
    last_name {Faker::Name.last_name}   
    first_name {Faker::Name.first_name}      
    last_name_kana {Faker::Name.last_name}   
    first_name_kana {Faker::Name.last_name}  
    birthday {Faker::Date.between(from: '2014-09-23', to: '2020-09-25')} 
  end
end
