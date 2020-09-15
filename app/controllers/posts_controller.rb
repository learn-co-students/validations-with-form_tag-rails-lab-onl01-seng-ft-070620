class PostsController < ApplicationController
  def show
      @post = Post.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
      @post = Post.new(post_params(:title, :content, :category))
      if @post.save
          redirect_to post_path(@post) 
          return
      end
      render 'new'
  end

  def edit
      @post = Post.find(params[:id])
  end

  def update
      @post = Post.find(params[:id])
      if @post.update(post_params(:title, :content, :category))
          redirect_to post_path(@post)
          return
      end
      render 'edit'
  end

  private

  def post_params(*args)
      params.permit(args)
  end
end
