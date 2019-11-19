class Feed < ApplicationRecord
  validates :title, :url, presence: true
  validates :url, uniqueness: true, format: {with: /(https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]+\.[^\s]{2,}|www\.[a-zA-Z0-9]+\.[^\s]{2,})/ }
  has_many :articles, dependent: :destroy

  protected

  def self.all_feeds_json
    Feed.all.order(id: :desc).as_json(only: [:id, :title])
  end
end
