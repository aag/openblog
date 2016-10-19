module AdminHelper
  def published_status(post)
    if post.published?
      'veröffentlicht'
    else
      'Entwurf'
    end
  end
end
