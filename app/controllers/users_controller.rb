class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update, :index]
  before_action :logged_in_redirect, only: [:create, :new]
  before_action :require_same_user, only: [:edit, :update, :destroy]

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

  def update
    if @user.update(user_params)
      flash[:notice] = "Your account information was successfully updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to MessageMe #{@user.username}, you have successfully signed up"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now[:error] = "Something went wrong while creating your user. Please try again!"
      render 'new'
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil if @user == current_user
    flash[:success] = "Account and all associated messages has been deleted"
    redirect_to login_path
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

  def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own account"
      redirect_to @user
    end
  end
end
