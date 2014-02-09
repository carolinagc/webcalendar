class CalendarsController < ApplicationController
  before_action :set_calendar, only: [:show, :edit, :update, :destroy]
  def index
    if user_signed_in?
      @calendars = Calendar.where(user: current_user)
    end
    # TODO: Handle anonymous users
  end

  def active
    if user_signed_in?
      unless current_user.current_calendar_id
        # try out some things
        calendar = Calendar.create(title: "test", user: current_user)
        Event.create(name: "test event", event_type: "bla", startdatetime: DateTime.now, calendar: calendar)
        current_user.current_calendar = calendar
      end
      @calendar = current_user.current_calendar
    else
      # TODO: Figure out calendar for unregistered user
      @calendar = Calendar.create(title: "new", user: User.find(0))
    end
    @events = @calendar.events
  end

  def show
    if user_signed_in?
      @events = @calendar.events
    end
  end

  def new
    @calendar = Calendar.new
  end

  def edit
  end

  def create
    @calendar = Calendar.new(calendar_params)

    if @calendar.save
      redirect_to @calendar, notice: 'Calendar was successfully created'
    else
      render action: 'new'
    end
  end

  def update
    if @calendar.update(calendar_params)
      redirect_to @calendar, notice: 'Calendar was successfully updated'
    else
      render action: 'edit'
    end
  end

  def destroy
    @calendar.destroy
    redirect_to calendars_url, notice: 'Calendar was successfully removed'
  end

  private

    def set_calendar
      @calendar = Calendar.find(params[:id])
    end

    def calendar_params
      params.require(:calendar).permit(:title, :user_id)
    end
end
