class UsersController < ApplicationController
  before_action :logged_in_redirect

  def new

  end

  private

  def logged_in_redirect
    if logged_in?
      flash[:error] = "You are already signed up and logged in"
      redirect_to root_path
    end
  end

end
