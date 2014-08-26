class OrganizersController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]  
  def index
    @organizers = Organizer.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @organizers }
    end

  end

  def show
    @organizer = Organizer.find(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @organizer }
    end

  end
  
  def new
    @organizer = Organizer.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @organizer }
    end

  end

  def create
    @organizer = Organizer.new(organizer_params)
    if @organizer.save
      redirect_to @organizer, notice: 'Organizer was successfully created.' 
      format.json { render json: @organizer, status: :created, location: @organizer }
    else
      render "new"
      format.json { render json: @organizer.errors, status: :unprocessable_entity }
    end 
  end

  def edit
    @organizer = Organizer.find(params[:id])
  end

  def update
    @organizer = Organizer.find(params[:id])
    if @organizer.update_attributes(organizer_params)
       redirect_to @organizer, notice: 'Organizer was successfully updated.'
      format.json { head :no_content }
    else
      format.html { render action: "edit" }
      format.json { render json: @organizer.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    @organizer = Organizer.find(params[:id])
    @organizer.destroy
    if @organizer.destroy 
      redirect_to organizers_path
      format.json { head :no_content }
    end
  end
  
private
  def organizer_params    
    params.require(:organizer).permit(:name, :description)
  end

end
