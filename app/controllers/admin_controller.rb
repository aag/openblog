class AdminController < ApplicationController
  def index
    @posts = Post.all
                 .order(created_at: :desc)
  end

  def publish_post
    post = Post.find(params[:id])
    post.publish_now!

    redirect_to(admin_url)
  end
end
