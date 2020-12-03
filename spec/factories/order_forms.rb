FactoryBot.define do
  factory :order_form do
    postal_code { '123-4567' }
    prefecture_id { 3 }
    city { '東京都' }
    block { '1-1' }
    phone_number { "111-1111" }
    user_id { 1 }
    item_id { 1 }
    token {"tok_abcdefghijk00000000000000000"}
  end
end