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
    if num_comments_on_post >= 10
      errors.add(:body, 'ist über das Limit für diesen Artikel (max. 10 Kommentare)')
    end
  end

  def max_comments_per_day
    if num_comments_today >= 2
      errors.add(:body, 'ist über das Limit für heute für diesen Artikel (max. 2 Kommentare)')
    end
  end

  def num_comments_on_post
    if post.nil?
      return 0
    end

    if new_record?
      post.comments.ham.count
    else
      post.comments.ham.where('id != :self_id', {self_id: id}).count
    end
  end

  def num_comments_today
    if post.nil?
      return 0
    end

    beginning_of_day = Time.zone.now.beginning_of_day
    end_of_day = beginning_of_day.end_of_day

    if new_record?
      post.comments
          .ham
          .where('created_at >= :start_date AND created_at <= :end_date',
                 {start_date: beginning_of_day, end_date: end_of_day})
          .count
    else
      post.comments
          .ham
          .where('created_at >= :start_date AND created_at <= :end_date AND id != :self_id',
                 {start_date: beginning_of_day, end_date: end_of_day, self_id: id})
          .count
    end
  end
end
