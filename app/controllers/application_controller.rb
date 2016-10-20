class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :count_posts, :count_comments

  protected

  def count_posts
    @num_posts = Post.published.count
  end

  def count_comments
    @num_comments = Comment.ham.count
  end
end
