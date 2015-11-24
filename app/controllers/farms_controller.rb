class FarmsController < ApplicationController
  before_action :require_user
  before_action :set_farm, only: [:show, :review]

  def index
    @farms = Farm.reviewed
    @review = Review.featured
  end

  def show
    @review = Review.new
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
      flash.now[:error] = 'The data was not sufficient to create the farm'
      render 'new'
    end
  end

  private

  def set_farm
    @farm = Farm.find_by_id(params[:id])

    unless @farm
      flash[:error] = 'This farm could not be found'
      redirect_to farms_path
    end
  end

  def farm_params
    params.require(:farm).permit(
      :name, :street, :zip_code, :city, :country)
  end
end

