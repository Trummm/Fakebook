class UsersController < ApplicationController
  before_action :load_activities, only: %i(index destroy show edit update)
  before_action :find_user, only: %i[show edit update index]
  def index; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path
    else
      render :new
    end
  end

  def show; end

  def edit; end
  
  def update
    if @user.update(user_params_update)
      flash.now[:success] = 'Profile updated'
      redirect_to @user
    else
      render :edit
    end
  end
  private 
  def user_params_update
    params.require(:user).permit(:name, :image, :background, :phone, :email, :nickname, :introduce, :password)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_digest)
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end

  def load_activities
    @activities = PublicActivity::Activity.order('created_at DESC').limit(20)
  end
end
