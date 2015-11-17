class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def welcome
    @farms = Farm.recent
    @review = Review.featured
  end
end
