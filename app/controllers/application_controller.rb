class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?
  before_action :redirect_logged_in_users, only: [:welcome]

  def welcome
    @farms = Farm.reviewed.recent
    @review = Review.featured
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def require_user
    unless logged_in?
      flash[:error] = 'Access restricted to authenticated users'
      redirect_to root_path
    end
  end

  def redirect_logged_in_users
    redirect_to home_path if logged_in?
  end
end
