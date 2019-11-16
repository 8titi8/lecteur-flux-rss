require 'nokogiri'
require 'open-uri'

namespace :new_feed do

  desc "Get all Articles when new feed is added"
  task :all_articles => [:environment] do
    # get the last added feed
    feed = Feed.last
    i = 0

    # Open the rss xml feed
    doc = Nokogiri::XML(open(feed[:url]))

    # Get all info to add in DB
    doc.css('item').each do |article|
      title = article.css('title').text
      date = article.css('pubDate').text.to_date
      summary = article.css('description').text
      link = article.css('link').text
      Article.create!(title: title, summary: summary, date: date, status: false, link: link, feed_id: feed.id)
      i += 1
    end
    puts "========================="
    puts "#{feed.title}"
    puts "#{i} articles ajoutés"
    puts "========================="
  end
end
