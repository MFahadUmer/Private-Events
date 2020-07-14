class EventsController < ApplicationController
    def new
      @party = Event.new
    end

    def create
      @party = Event.new(event_params)
      @party.creator = session[:current_user]
      @party.save
    end

    private

    def event_params
        params.require(:event).permit(:event)
    end
end
