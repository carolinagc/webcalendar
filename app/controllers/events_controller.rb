class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end
  
  def new
    @event = Event.new
    @locations = Location.all
    @organizers = Organizer.all
    @tags = Tag.all
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event, notice: 'Event was successfully created.' 
    else
      render "new"
    end 
  end

  def edit
    @event = Event.find(params[:id])
    @locations = Location.all
    @organizers = Organizer.all
    @tags = Tag.all
  end

  def update
    @event = Event.find(params[:id])
    
    if @event.update_attributes(event_params)
       redirect_to @event, notice: 'Event was successfully updated.'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    if @event.destroy 
      redirect_to events_path
    end
  end
  
private
  def event_params    
    params.require(:event).permit(:name, :day, :time, :description, :event_type, :location_id)
  end

end
