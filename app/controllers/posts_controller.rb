class PostsController < ApplicationController
  before_action :load_activities, only: %i(index destroy show edit update)
  before_action :find_post, only: %i[destroy show edit update]
  def index
    # @posts = Post.all.order(created_at: :desc)
    @posts = []
    follows = Follower.where(follower_id: current_user.id)
    follows.each do |follow|
      @posts += Post.where(user_id: follow.following_id).order(created_at: :desc)
    end
    @posts += Post.where(user_id: current_user.id).order(created_at: :desc)
    @post = Post.new
  end
  
  def new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.save
    redirect_to request.referrer
  end

  def edit; end

  def show
    @comment = Comment.new
    @comments = @post.comments.order(created_at: :desc)
  end

  def destroy
    if @post.destroy
      flash.now[:success] = "Delete Success!"
      redirect_to request.referrer
    end
  end

  def destroy_all_notify
    @activity = PublicActivity::Activity.all
    @activity.destroy_all
    redirect_to request.referrer
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    end
  end

  private
  def find_post
    @post = Post.find(params[:id])
  end
  def post_params
    params.require(:post).permit(:user_id, :content, :image)
  end
  def load_activities
    @activities = PublicActivity::Activity.order('created_at DESC').limit(20)
  end
end
