class Post < ApplicationRecord
  validates :title, length: { in: 10..50 }
  validates :body, presence: true

  scope :published, -> { where('published_at IS NOT NULL') }
end
