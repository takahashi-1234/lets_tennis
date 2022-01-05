FactoryBot.define do
  factory :court do
    name {"とてもとてもとてもとてもとても長い名前の公園"}
    latitude { Faker::Number.within(range: 35.5..37.0)}
    longitude { Faker::Number.within(range: 138.0..140.0)}
  end
end