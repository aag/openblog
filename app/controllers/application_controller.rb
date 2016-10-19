class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :count_posts

  protected

  def count_posts
    @num_posts = Post.published.count
  end
end
