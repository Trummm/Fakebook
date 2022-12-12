class UsersController < ApplicationController
  before_action :find_user, only: %i[show edit update]
  def index; end

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

  def find_user
    @user = User.find_by(id: params[:id])
  end
end
