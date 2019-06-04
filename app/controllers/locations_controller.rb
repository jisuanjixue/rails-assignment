class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end
  
  
  def new
    @location = Location.new
  end

  def create
    @location = Location.create!(location_params)

    if @location.save
      flash[:success] = "Location created!"
      redirect_to courses_path
    else
      render "new"
    end
  end

  protected

  def location_params
    params.require(:location).permit(:name)
  end
end
