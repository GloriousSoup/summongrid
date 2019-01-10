class EventsController < ApplicationController
    before_action :find_event

    def start
      @event.start
      redirect_back(fallback_location: root_path)   
    end

    def stop
      @event.stop
      redirect_back(fallback_location: root_path)   
    end

    def change_mood
      @event.update_demon_mood
      redirect_back(fallback_location: root_path)   
    end
    
    private
    def find_event
      @event = Event.find_by! key: params[:id].upcase
    end


end
