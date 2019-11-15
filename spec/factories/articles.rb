FactoryBot.define do
  factory :article do
    title { Faker::Book.title }
    summary { Faker::Lorem.paragraph }
    date { Faker::Date.between(from: 2.weeks.ago, to: Date.today) }
    status { false }
    link { Faker::Internet.url }
    feed { FactoryBot.create(:feed) }
  end
end
