class Stage::EventsController < Stage::BaseController

    before_action :find_event

    def show
    end
    

    private

    def find_event
    @event = Event.find params[:id]
    end

end