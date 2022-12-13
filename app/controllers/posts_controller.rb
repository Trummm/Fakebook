class PostsController < ApplicationController
  before_action :find_post, only: %i[destroy]
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
    if @post.destroy
      flash.now[:success] = "Delete Success!"
      redirect_to request.referrer
    end
  end

  private
  def find_post
    @post = Post.find(params[:id])
  end
  def post_params
    params.require(:post).permit(:user_id, :content, :image)
  end
end
