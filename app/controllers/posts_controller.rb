class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
    @post = Post.new
  end
  
  def new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:success] = 'Create Success!'
      redirect_to request.referrer
    else
      render :new
    end 
  end

  def update
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:user_id, :content, :image)
  end
end
