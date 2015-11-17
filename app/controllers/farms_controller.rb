class FarmsController < ApplicationController
  before_action :require_user

  def index
    @farms = Farm.all
    @review = Review.featured
  end
end

