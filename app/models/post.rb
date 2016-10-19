class Post < ApplicationRecord
  validates :title,
            presence: { message: 'ist ein Pflichtfeld' },
            length: {
                in: 10..50,
                too_short: 'ist zu kurz (Mindestlänge 10 Zeichen)',
                too_long: 'ist zu lang (Maximallänge 50 Zeichen)'
            }
  validates :body, presence: { message: 'ist ein Pflichtfeld' }

  scope :published, -> { where('published_at IS NOT NULL') }

  def unpublished?
    self.published_at.nil?
  end

  def published?
    !self.unpublished?
  end

  def publish_now!
    self.published_at = Time.now
    self.save!
  end
end
