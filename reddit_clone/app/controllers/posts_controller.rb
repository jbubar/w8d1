class PostsController < ApplicationController
  # before_action :
  def new
    @subs = Sub.all
    @post = Post.new 
    render :new 
  end

  def edit
    @subs = Sub.all
    @post = Post.find(params[:id])
    render :edit
  end

  def show
    @post = Post.find(params[:id])
    render :show 
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id 


    if @post.save 
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages 
      render :new 
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post
      @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages 
      render :new 
    end

  end

  private 

  def post_params
    params.require(:post).permit(:title, :content, :url, :sub_id)
  end
end
