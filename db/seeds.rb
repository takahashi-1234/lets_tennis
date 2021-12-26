# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


operation_kind = ["公営", "民営"]
court_kind = ["オムニ", "クレイ", "ハード"]
price = ["1000円未満", "1000円〜2000円", "2000円〜3000円", "4000円以上"]
age = ["10代", "20代", "30代", "40代", "50代", "60代", "70代"]
years_of_experience = ["1年未満", "1年以上5年未満", "5年以上10年未満", "10年以上"]
level = ["初心者", "中級者", "中上級者", "上級者"]
member = ["2~10人", "10~20人", "20~30人", "30~40人", "40人以上"]
report = ["場所が間違っている", "金額が間違っている"]


Admin.create!(
  email: "admin@admin.com",
  password: "letstennis"
  )
50.times{
  Customer.create!(
    name: Gimei.name.kanji,
    age: age.sample,
    years_of_experience: years_of_experience.sample,
    level: level.sample,
    is_quited: false,
    email: Faker::Internet.email,
    password: "letstennis",
    created_at: Faker::Date.between(from:'2020-01-01', to:'2021-12-28'),
    updated_at: Faker::Date.between(from:'2020-01-01', to:'2021-12-28')
  )
}

50.times{
  Court.create(
    customer_id: rand(1..20),
    name: "#{Gimei.address.town.kanji}テニスコート",
    address: Gimei.address.kanji,
    court_kind: court_kind.sample,
    operation: operation_kind.sample,
    price: price.sample,
    latitude: Faker::Number.within(range: 35.5..37.0),
    longitude: Faker::Number.within(range: 138.0..140.0),
    created_at: Faker::Date.between(from:'2020-01-01', to:'2021-12-28'),
    updated_at: Faker::Date.between(from:'2020-01-01', to:'2021-12-28')
  )
}

100.times{
  Circle.create(
    circle_name: Faker::Team.name,
    leader_name: Gimei.name.kanji,
    level: level.sample,
    court_id: rand(1..50),
    customer_id: rand(1..20),
    member: member.sample,
    email: Faker::Internet.email,
    body: "活動日時は基本毎週土曜日13時から17時です。 競技志向のクラブではなく、年齢・性別・上手・下手隔てなく、楽しく笑いのあるテニスクラブを目指しております。参加費は年会費の3,000円程でそれ以外に参加費等はかかりません。",
    created_at: Faker::Date.between(from:'2020-01-01', to:'2021-12-28'),
    updated_at: Faker::Date.between(from:'2020-01-01', to:'2021-12-28')
    )
}

200.times{
  event_date=Faker::Date.between(from:'2022-01-01', to:'2022-01-31')
  Event.create(
    circle_id: rand(1..30),
    title: "参加者募集！",
    body: "ラリーと試合形式がメインです！ここ最近は毎回体験で参加する方がいますので、この機会に是非！",
    event_date: event_date,
    event_deadline: event_date,
    created_at: Faker::Date.between(from:'2020-01-01', to:'2021-12-28'),
    updated_at: Faker::Date.between(from:'2020-01-01', to:'2021-12-28')
    )
}

20.times{
    Report.create(
      customer_id: rand(1..50),
      court_id: rand(1..50),
      report_content: report.sample,
      report_detail: "詳細はHPを見てください。https://〜〜〜〜",
      is_supported: false,
      created_at: Faker::Date.between(from:'2020-01-01', to:'2021-12-28'),
      updated_at: Faker::Date.between(from:'2020-01-01', to:'2021-12-28')
    )
}