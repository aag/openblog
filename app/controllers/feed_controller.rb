class FeedController < ApplicationController
  def posts
    max_posts_in_feed = 10

    @posts = Post.published
                 .order(published_at: :desc)
                 .limit(max_posts_in_feed)
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end
end