class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @event = Event.new
    events_shown
  end

  def events_shown
    if user_signed_in?
      @events = Event.all.order(startdatetime: :desc)
    else
      @events = Event.where(public:true).order(startdatetime: :desc)
    end
  end

  def calendar
    events_shown
    @events_by_date = @events.group_by { |i| i.startdatetime.strftime("%Y %m %d") }
    @date = params[:date] ? DateTime.parse(params[:date]) : Date.today
    @num_weeks = params[:num_weeks] || @num_weeks="4"
  end

  def show
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
    @locations = Location.all
    @organizers = Organizer.all
    @tags = Tag.all
  end

  def update
    if @event.update_attributes(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render 'edit', notice: "Check mandatory fields."
    end
  end

  def destroy
    @event.destroy
    if @event.destroy
      redirect_to events_path
    end
  end

  private
    def event_params
      params.require(:event).permit(:name, :startdatetime, :duration, :description, :event_type, :location_id, :organizer_id, :tag_ids, :public, :responsible, :calendar_id)
    end

    def set_event
      @event = Event.find(params[:id])
    end

end
