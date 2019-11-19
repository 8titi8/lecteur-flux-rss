class Feed < ApplicationRecord
  validates :title, :url, presence: true
  validates :url, uniqueness: true
  has_many :articles

  protected

  def self.all_feeds_json
    Feed.all.order(id: :desc).as_json(only: [:id, :title])
  end
end
