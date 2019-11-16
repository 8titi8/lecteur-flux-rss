require 'nokogiri'
require 'open-uri'

namespace :new_feed do

  desc "Get all Articles when new feed is added"
  task :all_articles => [:environment] do
    feed = Feed.last
    doc = Nokogiri::XML(open(feed[:url]))
    doc.css('item').each do |article|
      title = article.css('title').text
      date = article.css('pubDate').text.to_date
      summary = article.css('description').text
      link = article.css('link').text
      Article.create!(title: title, summary: summary, date: date, status: false, link: link, feed_id: feed.id)
    end
  end
end
