module AdminHelper
  def published_status(post)
    if post.published?
      'veröffentlicht'
    else
      'Entwurf'
    end
  end

  def spam_status(comment)
    if comment.spam?
      'spam'
    else
      'nicht spam'
    end
  end
end
