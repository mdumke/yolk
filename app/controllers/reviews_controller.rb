class ReviewsController < ApplicationController
  before_action :require_user, only: [:index]

  def index
    @reviews = Review.order('created_at desc')
    @farms = Farm.all
  end
end

