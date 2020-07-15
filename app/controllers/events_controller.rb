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
      # @current_user = session[:current_user]
      # @event = Event.User.build(event_params)
      # @post = current_user.posts.build(post_params)
      @event = current_user.creator_events.build(event_params)

      # @event.creator = session[:current_user]
      # @event.save
      if @event.save
        redirect_to events_path
      end
    end

  def current_user
    current_user = User.find_by(username: session[:current_user])
    current_user
  end

    private

    def event_params
        params.require(:event).permit(:event)
    end
end
