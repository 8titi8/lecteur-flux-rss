class FeedsController < ApplicationController

  def index
    @feeds = Feed.all.order(id: :desc)
    @feed = Feed.new
    @all_feeds = Feed.all_feeds_json
    @all_articles = Article.all_articles_json
  end

  def create
    @feed = Feed.new(feed_params)

    respond_to do |format|
      if @feed.save
        # get the articles from the feed that has been added in DB
        ArticlesScraper.new.get_articles
        @articles = Article.where(feed_id: @feed.id).as_json(only: [:id, :title, :summary, :date, :status, :link, :feed_id])
        format.html {redirect_to root_path}
        format.js
      else
        @feeds = Feed.all
        @all_articles = Article.all_articles_json
        format.html {render :index}
      end
    end

  end

  private

  def feed_params
    params.require(:feed).permit(:title, :url)
  end

end
