class FeedsController < ApplicationController
  def index
    @feeds = Feed.all
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
