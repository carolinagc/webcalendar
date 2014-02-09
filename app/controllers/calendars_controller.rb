class CalendarsController < ApplicationController
  before_action :set_calendar, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:active]

  def index
    if user_signed_in?
      @calendars = Calendar.where(user: current_user)
    end
    # TODO: Handle anonymous users
  end

  def active
    if user_signed_in?
      if current_user.current_calendar_id
        @calendar = current_user.current_calendar
      else
        # TODO: Pick the first available calendar if there is one available
        redirect_to new_calendar_url, notice: "You don't have any calendars. Create one here."
      end
    else
      redirect_to calendars_url, notice: "Nothing here"
    end
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
      @calendar = Calendar.find_by_token(params[:token])
    end

    def calendar_params
      params.require(:calendar).permit(:title, :user_id)
    end
end
