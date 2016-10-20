class Comment < ApplicationRecord
  belongs_to :post, inverse_of: :comments

  validates :body, presence: {message: 'ist ein Pflichtfeld'}
  validates_format_of :body, with: /(\w+ ){4,}\w/, message: 'ist zu kurz (min. 5 Wörter)'
  validates_associated :post

  validate :max_comments_per_post, :max_comments_per_day

  scope :ham, -> { where(spam: false) }

  def mark_as_spam!
    self.spam = true
    save!
  end

  def mark_as_ham!
    self.spam = false
    save!
  end

  def ham?
    !self.spam?
  end

  private

  def max_comments_per_post
    if num_comments_on_post >= Post::MAX_COMMENTS
      errors.add(:body, "ist über das Limit für diesen Artikel (max. #{Post::MAX_COMMENTS} Kommentare)")
    end
  end

  def max_comments_per_day
    if num_comments_today >= Post::MAX_DAILY_COMMENTS
      errors.add(:body, "ist über das Limit für heute für diesen Artikel (max. #{Post::MAX_DAILY_COMMENTS} Kommentare)")
    end
  end

  def num_comments_on_post
    if post.nil?
      return 0
    end

    if new_record?
      post.num_comments
    else
      post.num_comments_excluding(self)
    end
  end

  def num_comments_today
    if post.nil?
      return 0
    end

    if new_record?
      post.num_comments_today
    else
      post.num_comments_today_excluding(self)
    end
  end
end
