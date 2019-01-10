class EventsController < ApplicationController
    before_action :find_event

    private
    def find_event
      @event = Event.find_by! key: params[:id].upcase
    end
end
