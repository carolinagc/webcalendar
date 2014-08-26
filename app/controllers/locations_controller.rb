class LocationsController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]  
  def index
    @locations = Location.all
    respond_to do |format|
#      format.html # index.html.erb
      format.json { render json: @locations }

    end


  end

  def show
    @location = Location.find(params[:id])
    respond_to do |format|
 #     format.html # index.html.erb
      format.json { render json: @location }
    end

  end
  
  def new
    @location = Location.new
    format.json { render json: @location }

  end

  def create
    @location = Location.new(location_params)
    if @location.save
  #    redirect_to @location, notice: 'Location was successfully created.' 
      format.json { render json: @location, status: :created, location: @location }

    else
   #   render "new"
      format.json { render json: @location.errors, status: :unprocessable_entity }
    end 
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    if @location.update_attributes(location_params)
    #   redirect_to @location, notice: 'Location was successfully updated.'
      format.json { render json: @location.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    if @location.destroy 
     # redirect_to locations_path
      format.json { head :no_content }

    end
  end
  
private
  def location_params    
    params.require(:location).permit(:name, :description, :address)
  end

end
