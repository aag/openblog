class Comment < ApplicationRecord
  belongs_to :post, inverse_of: :comments

  validates :body, presence: { message: 'ist ein Pflichtfeld' }
  validates_format_of :body, with: /(\w+ ){4,}\w/, message: 'ist zu kurz (min. 5 Wörter)'
  validates_associated :post

  validate :max_comments_per_post, :max_comments_per_day

  def max_comments_per_post
    # There is no guaranteed ordering of the validations, so we can't assume
    # that the post has been set.
    if !post.nil? && post.comments.count >= 10
      errors.add(:body, 'ist über das Limit für diesen Artikel (max. 10 Kommentare)')
    end
  end

  def max_comments_per_day
    # There is no guaranteed ordering of the validations, so we can't assume
    # that the post has been set.
    if post.nil?
      return
    end

    beginning_of_day = Time.zone.now.beginning_of_day
    end_of_day = beginning_of_day.end_of_day

    num_comments_today = post.comments
                             .where('created_at >= :start_date AND created_at <= :end_date',
                                   {start_date: beginning_of_day, end_date: end_of_day})
                             .count

    if num_comments_today >= 2
      errors.add(:body, 'ist über das Limit für heute für diesen Artikel (max. 2 Kommentare)')
    end
  end
end
