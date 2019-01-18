class Artillery

	def self.set(item_id,data)
		@firebase ||= setup_firebase
		@firebase.update(item_id,data)
	end

	def self.get(item_id)
		@firebase ||= setup_firebase
		@firebase.get(item_id)
	end

    #One channel per game per group (crew/players). This is the citydash simplified firebase integration!
    def self.channel_for(event,type) 
        x = Rails.env.to_s[0..0] + "_summongrid_#{event.id}_#{type}"
        y = Digest::SHA256.hexdigest(x)[0..4]
        return "#{x}_#{y}"
    end
private

    def self.setup_firebase
        base_url = Rails.application.credentials.firebase_rb[:base_url]
        json_private_key = Rails.application.credentials.firebase_rb[:adminPrivateKeyJson]

		@firebase = Firebase::Client.new(base_url, json_private_key)
	end

end
