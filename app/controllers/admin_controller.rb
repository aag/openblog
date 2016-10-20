class AdminController < ApplicationController
  def index
    @posts = Post.all
                 .order(created_at: :desc)

    @comments = Comment.all
                    .order(created_at: :desc)
  end

  def publish_post
    post = Post.find(params[:id])
    post.publish_now!

    redirect_to(admin_url)
  end

  def mark_spam
    comment = Comment.find(params[:id])
    comment.mark_as_spam!

    redirect_to(admin_url)
  end

  def mark_ham
    comment = Comment.find(params[:id])
    if !comment.post.accepting_new_comments?
      flash[:danger] = 'Status-Änderung fehlgeschlagen: der Artikel darf im Moment keine neue Kommentare bekommen'
    else
      comment.mark_as_ham!
    end

    redirect_to(admin_url)
  end
end
