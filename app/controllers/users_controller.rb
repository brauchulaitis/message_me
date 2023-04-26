class UsersController < ApplicationController
  before_action :logged_in_redirect

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to MessageMe #{@user.username}, you have successfully signed up"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def logged_in_redirect
    if logged_in?
      flash[:error] = "You are already signed up and logged in"
      redirect_to root_path
    end
  end

end
