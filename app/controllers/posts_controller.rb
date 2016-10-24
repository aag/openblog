class PostsController < ApplicationController
  def show
    @post = Post.find_by_id(params[:id])
    @comment = Comment.new

    if @post.nil? or @post.unpublished?
      render status: 404, plain: 'Fehler: Der Artikel wurde nicht gefunden'
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :body))

    if @post.save
      flash[:success] = 'Artikel wurde erfolgreich erstellt'
      redirect_to admin_path
    else
      flash[:danger] = 'Fehler beim Erstellen des Artikels'
      render :new
    end
  end

  def create_comment
    @comment = Comment.new(params.require(:comment).permit(:body, :post_id))
    @post = Post.find_by_id(params[:id])

    if @comment.save
      flash[:success] = 'Kommentar wurde erfolgreich erstellt'
      redirect_to post_path(@post)
    else
      flash[:danger] = 'Fehler beim Erstellen des Kommentars'
      render :show
    end
  end

  def index
    @posts = Post.published
                 .order(published_at: :desc)

    max_visible_comments = 10
    @comments = Comment.ham
                    .order(created_at: :desc)
                    .limit(max_visible_comments)
  end
end
