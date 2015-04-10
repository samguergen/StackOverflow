class UserController < ApplicationController
# SAM WORKS FROM THIS LINE TO LINE 49















































#KEVIN STARTS WORKING FROM HERE DOWN

def new
  @user = User.new
end

def create
  @user = User.new(params[:user])

  if @user.save
    flash[:notice] = "Account registered!"
    redirect_back_or_default account_url
  else
    render :action => :new
  end
end






















































end
