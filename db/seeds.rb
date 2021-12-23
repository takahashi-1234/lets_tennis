# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
50.times{
  latitude=Faker::Number.within(range: 35.0..37.0) ,
  longitude=Faker::Number.within(range: 138.0..140.0),
  town=address.town.kanji,
  court=town+"テニスコート",
  Court.create!(
    customer_id: rand(1..20),
    name: court,
    address: "埼玉県",
    latitude: latitude,
    longitude: longitude,
    court_kind: ["オムニ","クレイ","ハード"].sample(1),
    operation: ["公営","民営"],
    price: ["1000円未満","1000円〜2000円","2000円〜3000円","4000円以上"].sample(1),
    created_at: Faker::Date.between(from:'2020-01-01',to:'2021-12-28'),
  )
}
