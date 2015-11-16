class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def welcome
    @farms = Farm.all
    @review = Review.all.sample
  end
end
