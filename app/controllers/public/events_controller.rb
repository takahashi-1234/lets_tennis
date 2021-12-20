class Public::EventsController < ApplicationController
  before_action:authenticate_customer!

  def new
    @event=Event.new
  end
  def create
    circle=Circle.find(params[:circle_id])
    @event=Event.new(event_params)
    @event.circle_id=circle.id
    if @event.save
      redirect_to circle_path(circle.id)
    else
      render :new
    end
  end
  
  private
  def event_params
    params.require(:event).permit(:title,:body,:event_date,:event_deadline)
  end
end
