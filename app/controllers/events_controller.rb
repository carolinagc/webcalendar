class EventsController < ApplicationController
  def create

  end
  def index

  end

private
  def event_params    
    params.require(:event).permit(:name)
  end

end
