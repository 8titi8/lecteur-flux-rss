class Article < ApplicationRecord
  validates :title, :summary, :date, :link, presence: true
  validates :status, inclusion: { in: [true, false] }
  belongs_to :feed
end
