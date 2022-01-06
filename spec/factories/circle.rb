FactoryBot.define do
  factory :circle do
    circle_name { Faker::Lorem.characters(number: 10) }
    body { Faker::Lorem.characters(number: 100)}
    leader_name { Faker::Lorem.characters(number: 10)}
    customer
  end
end