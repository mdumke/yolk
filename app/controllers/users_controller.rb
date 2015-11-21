class UsersController < ApplicationController
  before_action :require_user, only: [:show]
  before_action :redirect_logged_in_users, only: [:new]
  before_action :set_user, only: [:show]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome #{@user.first_name}! Your account was created!"
      redirect_to home_path
    else
      flash[:error] = 'Something prevented us from creating your account'
      render 'new'
    end
  end

  private

  def set_user
    @user = User.find_by_id(params[:id])

    unless @user
      flash[:error] = 'This user is not in our system.'
      redirect_to home_path
    end
  end

  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :power_animal, :email, :password)
  end
end

