FactoryBot.define do
  factory :court do
    name { Faker::Lorem.characters(number: 10) }
    address { "埼玉県" }
    operation { "公営" }
    court_kind { "オムニ" }
    price { "1000円以下" }
    latitude { 36 }
    longitude { 138 }
    customer
  end
end