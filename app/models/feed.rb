class Feed < ApplicationRecord
  validates :title, :url, presence: true
  has_many :articles
end
