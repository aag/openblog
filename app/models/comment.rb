class Comment < ApplicationRecord
  belongs_to :post, inverse_of: :comments

  validates :body, presence: { message: 'ist ein Pflichtfeld' }
  validates_format_of :body, with: /(\w+ ){4,}\w/, message: 'ist zu kurz (min. 5 Wörter)'

  validate :max_comments_per_post, :max_comments_per_day

  def max_comments_per_post
    if post.reload.comments.count >= 10
      errors.add(:body, 'ist über das Limit für diesen Artikel (max. 10 Kommentare)')
    end
  end

  def max_comments_per_day
    beginning_of_day = Time.zone.now.beginning_of_day

    num_comments_today = 0
    for comment in post.reload.comments do
      if comment.created_at > beginning_of_day
        num_comments_today += 1
      end
    end

    if num_comments_today >= 2
      errors.add(:body, 'ist über das Limit für heute für diesen Artikel (max. 2 Kommentare)')
    end
  end
end
