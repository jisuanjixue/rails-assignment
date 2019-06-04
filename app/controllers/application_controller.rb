class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

 
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_path
    end
  end

  
  def find_location_and_category
    @categories = Category.all
    @locations = Location.all
    @users = User.all
  end
end