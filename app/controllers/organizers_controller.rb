class OrganizersController < ApplicationController
  def index
    @organizers = Organizer.all
  end

  def show
    @organizer = Organizer.find(params[:id])
  end
  
  def new
    @organizer = Organizer.new
  end

  def create
    @organizer = Organizer.new(organizer_params)
    if @organizer.save
      redirect_to @organizer, notice: 'Organizer was successfully created.' 
    else
      render "new"
    end 
  end

  def edit
    @organizer = Organizer.find(params[:id])
  end

  def update
    @organizer = Organizer.find(params[:id])
    if @organizer.update_attributes(organizer_params)
       redirect_to @organizer, notice: 'Organizer was successfully updated.'
    end
  end

  def destroy
    @organizer = Organizer.find(params[:id])
    @organizer.destroy
    if @organizer.destroy 
      redirect_to organizers_path
    end
  end
  
private
  def organizer_params    
    params.require(:organizer).permit(:name, :description)
  end

end
