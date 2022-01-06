FactoryBot.define do
  factory :circle do
    circle_name { Faker::Lorem.characters(number: 10) }
    body { Faker::Lorem.characters(number: 100)}
    leader_name { Faker::Lorem.characters(number: 10)}
    member { "10人以上" }
    level { "初心者" }
    email { Faker::Internet.email }
    customer
    court
  end
end