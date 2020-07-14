class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

    def new
      @event = Event.new
    end

    def create
      @current_user = session[:current_user]
      # @event = Event.User.build(event_params)
      # @post = current_user.posts.build(post_params)

      @event = @current_user.events.build(event_params)
      # @event = session[:current_user].event.build(event_params)
      if @event.save
        redirect_to events_path
      end
    end

    private

    def event_params
        params.require(:event).permit(:event)
    end
end
