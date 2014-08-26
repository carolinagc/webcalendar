class EventsController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index, :calendar]  

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

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end

  end

  def calendar
    events_shown
    @events_by_date = @events.group_by { |i| i.startdatetime.strftime("%Y %m %d") }
    @date = params[:date] ? DateTime.parse(params[:date]) : Date.today
    @num_weeks = params[:num_weeks] || @num_weeks="4"
  end

  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @event }
    end

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
        format.json { render json: @event }
      end
    else
      respond_to do |format|
        flash[:error] = 'Something went wrong.'
        format.json { render json: @event.errors, status: :unprocessable_entity }
        format.html { render "new" }
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
      format.json { head :no_content }
    else
      render 'edit', notice: "Check mandatory fields."
      format.json { render json: @event.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    if @event.destroy
      redirect_to events_path
      format.json { head :no_content }
    end
  end

  private
    def event_params
      params.require(:event).permit(:name, :startdatetime, :duration, :description, :event_type, :location_id, :organizer_id, :tag_ids, :public, :responsible, :confirm)
    end

end
