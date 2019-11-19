class ArticlesController < ApplicationController

  def update
    @article = Article.find(params[:id])
    # Transform string status from params to boolean
    status = ActiveModel::Type::Boolean.new.cast(article_params[:status])

    respond_to do |format|
      if @article.update(status: status)
        @article.update(status: status)
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

  def article_params
    params.permit(:status, :id)
  end

end
