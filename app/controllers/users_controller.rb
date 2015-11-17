class UsersController < ApplicationController
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

  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :power_animal, :email, :password)
  end
end

