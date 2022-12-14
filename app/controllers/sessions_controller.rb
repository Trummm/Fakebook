class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email])
      if user&.authenticate(params[:session][:password])
          log_in(user)
          flash.now[:success] = "Login Success!"
          redirect_to dashboard_path
      else
        flash.now[:danger] = "Invalid email/password combination"
        render :new
      end
  end

  def destroy
    log_out if logged_in?
    flash.now[:danger] = "Logout Success!!"
    redirect_to root_path
  end
end
