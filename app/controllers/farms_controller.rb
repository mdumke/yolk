class FarmsController < ApplicationController
  before_action :require_user

  def index
    @farms = Farm.all
    @review = Review.featured
  end

  def new
    @farm = Farm.new
  end

  def create
    @farm = Farm.new(farm_params)

    if @farm.save
      flash[:notice] = "#{@farm.name} was added!"
      redirect_to @farm
    else
      flash[:error] = 'The data was not sufficient to create the farm'
      render 'new'
    end
  end

  private

  def farm_params
    params.require(:farm).permit(
      :name, :street, :zip_code, :city, :country)
  end
end

