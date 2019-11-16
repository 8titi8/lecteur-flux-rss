require 'nokogiri'
require 'open-uri'

namespace :feed_update do

  desc "Get new articles from feeds"
  task get_new_articles: [:environment] do
    feeds = Feed.all

    feeds.each do |feed|

      # Open the rss xml feed
      doc = Nokogiri::XML(open(feed[:url]))

      # get all articles from same feed
      articles = Article.where(feed_id: feed.id)
      i = 0
      j = 0

      # Get all info of each article to add in DB
      doc.css('item').each do |article|
        # skip creation if article already exists in DB
        if articles.where(title: (article.css('title').text)).any?
          j += 1
        else
          title = article.css('title').text
          date = article.css('pubDate').text.to_date.strftime("%d/%m/%y")
          summary = article.css('description').text
          link = article.css('link').text
          Article.create!(title: title, summary: summary, date: date, status: false, link: link, feed_id: feed.id)
          i += 1
        end
      end
      puts "========================="
      puts "#{feed.title}"
      puts "#{j} articles déjà présents"
      puts "#{i} ajoutés dans le feed"
      puts "========================="
    end
  end
end
