class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update]
  before_action :find_user, only: [:show, :edit, :update]
  
  def show
    @courses = current_user.courses.all
  end

  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def edit
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Registed successfully!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      flash[:success] = "edit user profile successfully!"
      redirect_to @user
    else
      flash[:error] = "edit error"
      render 'edit'
    end
  end

  private

  def find_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation)
  end
end

