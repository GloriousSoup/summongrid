class Event < ApplicationRecord
    include Rails.application.routes.url_helpers

    has_many :players

    include UniqueKey

    @@demon_moods = ["hungry","angry","malevolent","bored","curious","suspicious"]

    def start
        update_attribute(:is_started,true) 
        update_attribute(:game_started_at,Time.current) #needed for checkpoint auto-opening and game auto-finishing
        save!
    end

    def stop
        update_attribute(:is_started,false) 
        update_attribute(:times_poked,0) 
        save!
    end

    def poke_demon
        self.times_poked = 0 if self.times_poked == nil
        self.times_poked += 1

        update times_poked:times_poked,demon_mood:@@demon_moods.sample
        save!

        do_sync
    end

    def do_sync
        eventData = {
            demondata: {
                name: "Varsuvius",
                times_fed: 0,
                times_poked: times_poked.to_i,
                mood: self.demon_mood 
            }
        }

        Artillery.set('',{Artillery.channel_for(self,"player") => eventData})
    end
    

    def self.flutter
        Event.where(is_started:true).each do |e|
            e.poke_demon #syncs clients and sets dirty to false
        end
    end


    #Called once per minute
    def self.heartbeat
        #Stethoscope.check 
        #self.where(is_started:true).find_each {|e| e.heartbeat}
    end

    def heartbeat
        
    end


end
