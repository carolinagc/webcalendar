class LocationsController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]  
  def index
    @locations = Location.all
  end

  def show
    @location = Location.find(params[:id])
  end
  
  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to @location, notice: 'Location was successfully created.' 
    else
      render "new"
    end 
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    if @location.update_attributes(location_params)
       redirect_to @location, notice: 'Location was successfully updated.'
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    if @location.destroy 
      redirect_to locations_path
    end
  end
  
private
  def location_params    
    params.require(:location).permit(:name, :description, :address)
  end

end
