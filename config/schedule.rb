ENV['RAILS_ENV'] = "development"

every 2.hours do
  rake "feed_update:get_new_articles"
end
