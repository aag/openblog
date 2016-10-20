class Post < ApplicationRecord
  has_many :comments, inverse_of: :post

  validates :title,
            presence: {message: 'ist ein Pflichtfeld'},
            length: {
                in: 10..50,
                too_short: 'ist zu kurz (min. 10 Zeichen)',
                too_long: 'ist zu lang (max. 50 Zeichen)'
            }
  validates :body, presence: {message: 'ist ein Pflichtfeld'}

  scope :published, -> { where('published_at IS NOT NULL') }

  MAX_COMMENTS = 10
  MAX_DAILY_COMMENTS = 2

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

  def num_comments
    comments.ham.count
  end

  def num_comments_excluding(comment)
    if comment.new_record?
      num_comments
    else
      comments.ham.where('id != :id', {id: comment.id}).count
    end
  end

  def num_comments_today
    beginning_of_day = Time.zone.now.beginning_of_day
    end_of_day = beginning_of_day.end_of_day

    comments
        .ham
        .where('created_at >= :start_date AND created_at <= :end_date',
               {start_date: beginning_of_day, end_date: end_of_day})
        .count
  end

  def num_comments_today_excluding(comment)
    beginning_of_day = Time.zone.now.beginning_of_day
    end_of_day = beginning_of_day.end_of_day

    if comment.new_record?
      num_comments_today
    else
      comments
          .ham
          .where('created_at >= :start_date AND created_at <= :end_date AND id != :id',
                 {start_date: beginning_of_day, end_date: end_of_day, id: comment.id})
          .count
    end
  end

  def accepting_new_comments?
    num_comments < MAX_COMMENTS && num_comments_today < MAX_DAILY_COMMENTS
  end
end
