#!/usr/bin/env ruby

#RAILS_ENV must be set. Run with eg RAILS_ENV=production ./heartbeat.rb (and keep alive with systemd)

#Load the Rails app environment
root = File.expand_path(File.dirname(__FILE__))
root = File.dirname(root) until File.exists?(File.join(root, 'config'))
Dir.chdir(root)
require File.join(root, "config", "environment")

require 'eventmachine'

def log(m)
	Rails.logger.info "HEARTBEAT: #{m}"
end

log "Citydash heartbeat starting up"

EM.run {
    log "Citydash heartbeat starting up 1"
    log "Citydash heartbeat starting up 2"
	heartbeat_timer = EventMachine::PeriodicTimer.new(60) do
        log "Citydash heartbeat starting up3"
        log "Citydash heartbeat starting up3"
		log "Heartbeat at #{Time.now}"
		#Event.heartbeat
	end

	flutter_timer = EventMachine::PeriodicTimer.new(1) do
        log "Citydash heartbeat starting up4"
        log "Citydash heartbeat starting up4"
        log "Flutter at #{Time.now}"
		#Event.flutter
	end
}

log "Heartbeat terminated. This shouldn't happen. Systemd will restart it."
