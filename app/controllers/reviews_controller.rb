class ReviewsController < ApplicationController
  before_action :require_user, only: [:index, :create]

  def index
    @reviews = Review.order('created_at desc')
    @farms = Farm.all
  end

  def create
    @review = Review.new(review_params)
    @review.farm = Farm.find_by_id(params[:farm_id])
    @review.reviewer = current_user

    if @review.save
      flash[:notice] = "Thank you for reviewing #{@review.farm.name}!"
      redirect_to @review.farm
    else
      flash[:error] = "Something went wrong. Please review your review."
      render 'farms/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end

