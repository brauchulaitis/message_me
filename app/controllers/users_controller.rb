class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update]
  # before_action :set_user, only: [:show]
  # before_action :require_user, only: []
  # before_action :logged_in_redirect

  def new
    @user = User.new
  end

  def show
    @messages = @user.messages
  end

  def index
    @users = User
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to MessageMe #{@user.username}, you have successfully signed up"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def logged_in_redirect
    if logged_in?
      flash[:error] = "You are already signed up and logged in"
      redirect_to root_path
    end
  end
end
