require 'nokogiri'
require 'open-uri'

class ArticlesScraper < ApplicationRecord

  def get_last_feed
    # get the last added feed
    feed = Feed.last
  end

  def get_page
    # Open the rss xml feed
    doc = Nokogiri::XML(open(get_last_feed[:url]))
  end

  def get_articles
    i = 0
    # Get all info to add in DB
    get_page.css('item').each do |article|
      title = article.css('title').text
      date = article.css('pubDate').text.to_date.strftime("%d/%m/%Y")
      summary = article.css('description').text
      link = article.css('link').text
      Article.create!(title: title, summary: summary, date: date, status: false, link: link, feed_id: get_last_feed.id)
      i += 1
    end
  end

end
