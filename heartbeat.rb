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
puts "log Method 2 STARTUP"

EM.run {
	heartbeat_timer = EventMachine::PeriodicTimer.new(60) do
		#log "Heartbeat at #{Time.now}"
		#Event.heartbeat
	end

	flutter_timer = EventMachine::PeriodicTimer.new(5) do
		log "Flutter at #{Time.now}"
		log "log Method 1"
		puts "log Method 2"
		Event.flutter
	end
}

log "Heartbeat terminated. This shouldn't happen. Systemd will restart it."
