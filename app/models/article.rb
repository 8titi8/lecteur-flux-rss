class Article < ApplicationRecord
  validates :title, :summary, :date, :link, presence: true
  validates :status, inclusion: { in: [true, false] }
  belongs_to :feed

  protected

  def self.all_articles_json
    Article.all.as_json(only: [:id, :title, :summary, :date, :status, :link, :feed_id])
  end
end
