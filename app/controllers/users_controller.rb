class UsersController < ApplicationController
# SAM WORKS FROM THIS LINE TO LINE 49















































#KEVIN STARTS WORKING FROM HERE DOWN

def new
  @user = User.new
end

def create
  user = User.new(user_params)

  if (user.save)
    flash[:notice] = "Account registered!"
    session[:user_id] = user.id
    redirect_to root_path
  else
    render :action => :new
  end
end

private
  def user_params
    params.require(:user).permit(:name, :age, :location, :email, :password, :password_confirmation, :avatar)
  end











































end
