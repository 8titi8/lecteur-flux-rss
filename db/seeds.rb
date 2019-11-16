# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'nokogiri'
require 'open-uri'

case Rails.env
when 'development'
  feed_1 = Feed.create!(title: "Le Monde - Actu", url: "https://www.lemonde.fr/rss/une.xml")
  feed_2 = Feed.create!(title: "France Info - France", url: "https://www.francetvinfo.fr/france.rss")

  # Open the rss xml feed
  doc = Nokogiri::XML(open(feed_1[:url]))
  i = 0

  # Get all info to add in DB for 5 articles
  doc.css('item').each do |article|
    # Made it only 5 to be able to test the feed update task
    if i < 5
      title = article.css('title').text
      date = article.css('pubDate').text.to_date
      summary = article.css('description').text
      link = article.css('link').text
      Article.create!(title: title, summary: summary, date: date, status: false, link: link, feed_id: feed_1.id)
      i += 1
    else
      i += 1
    end
  end

  puts "========================="
  puts "#{feed_1.title} a bien été ajouté !"
  puts "========================="
  puts "#{feed_1.title}"
  puts "#{Article.all.count} articles ajoutés"
  puts "========================="
end
