class EventsController < ApplicationController
  def index
    @events = Event.all.order(startdatetime: :desc)
    @event = Event.new
  end

  def calendar
    @events = Event.all
    @events_by_date = @events.group_by { |i| i.startdatetime.strftime("%Y %m %d") }
    @date = params[:date] ? DateTime.parse(params[:date]) : Date.today
    @num_weeks = params[:num_weeks] || @num_weeks="4"
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
      respond_to do |format|
        flash[:notice] = 'Event was successfully created.'
        format.html {redirect_to @event }
        format.js
      end
    else
      respond_to do |format|
        flash[:error] = 'Something went wrong.'
        format.html { render "new" }
        format.js
      end
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
     else
      render 'edit', notice: "Check mandatory fields."
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
    params.require(:event).permit(:name, :startdatetime, :duration, :description, :event_type, :location_id, :organizer_id, :tag_ids, :public, :responsible)
  end

end
