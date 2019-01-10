
class Stage::PlayersController < Stage::BaseController

    before_action :find_event
        
    def create
        @event.players.create!(name:"New Player #{rand(99999)}")

        flash[:notice] = "Player created!!!"
        redirect_back(fallback_location: root_path)
    end



    private

    def find_event
    @event = Event.find params[:event_id]
    end

end
