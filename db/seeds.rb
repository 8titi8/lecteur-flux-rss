# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

case Rails.env
when 'development'
  Feed.create!(title: "Le Monde - Actu", url: "https://www.lemonde.fr/rss/une.xml")
  Feed.create!(title: "France Info - France", url: "https://www.francetvinfo.fr/france.rss")
end
