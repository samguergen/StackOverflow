class UserController < ApplicationController
# SAM WORKS FROM THIS LINE TO LINE 49

  def index
    @all_users = User.all
  end

  def new_login
    @the_user = User.find_by(email: params[:user][:email])
    if @the_user.try(:authenticate, params[:user][:password])
      session[:user_id] = @the_user.id
      redirect_to questions_path
    else
      flash.now[:danger] = "Invalid email/password combination"
      redirect_to login_path
    end
  end









#KEVIN STARTS WORKING FROM HERE DOWN

















































end
