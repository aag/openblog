class PostsController < ApplicationController
  def show
    @post = Post.find_by_id(params[:id])

    if @post.nil? or @post.unpublished?
      raise ActionController::RoutingError.new('Der Artikel wurde nicht gefunden')
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
end
