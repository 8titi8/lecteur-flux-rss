class FeedsController < ApplicationController
  def index
    @feeds = Feed.all
    @all_feeds = @feeds.as_json(only: [:id, :title])
    @all_articles = Article.all.as_json(only: [:id, :title, :summary, :date, :status, :link])
  end

  def create
    @feed = Feed.new(feed_params)
    if @feed.save
      redirect_to action: "index"
      flash[:success] = "Flux enregistré !"
    else
      flash[:error] = "Un problème est survenu"
    end
  end


  private

  def feed_params
    params.permit(:title, :url)
  end
end
