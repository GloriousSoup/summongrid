class Stage::BaseController < ApplicationController

    before_action :authenticate_admin_user!
  
    def index
      @events = Event.all
    end
end