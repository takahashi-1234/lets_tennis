FactoryBot.define do
  factory :event do
    title { Faker::Lorem.characters(number: 10) }
    body { Faker::Lorem.characters(number: 50) }
    event_date { Faker::Date.between(from:'2020-01-01', to:'2021-12-28') }
    event_deadline { Faker::Date.between(from:'2020-01-01', to:'2021-12-28') }
    circle
  end
end