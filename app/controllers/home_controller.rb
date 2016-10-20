class HomeController < ApplicationController
  def index
    @posts = Post.published
                 .order(published_at: :desc)
  end
end
