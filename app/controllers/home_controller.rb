class HomeController < ApplicationController
  MAX_VISIBLE_POSTS = 10

  def index
    @posts = Post.published
                 .order(published_at: :desc)
                 .limit(MAX_VISIBLE_POSTS)
  end
end
