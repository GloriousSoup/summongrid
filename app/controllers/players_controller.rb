class PlayersController < ApplicationController

    #before_action :find_player

    def index
        @players = Player.all
    end

    def show
        find_player
    end

    private

    #def find_team
     #   @team = Team.find_by! key: params[:id].upcase
     #   I18n.locale = @team.event.theme
    #  end


    def find_player
        @player = Player.find_by! key: params[:id].upcase
        @event = @player.event
    end

end
