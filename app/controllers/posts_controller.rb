class PostsController < ApplicationController

  def index
    @posts = Post.all.order("Created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end
  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(posts_params)
      redirect_to @post
      else
        render 'edit'
        end
    end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end
  def posts_params
    params.require(:post).permit(:title, :body)
  end
end
