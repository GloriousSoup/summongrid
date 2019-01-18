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
        base_url = "https://summongrid.firebaseio.com/";
        json_private_key = '{
            "type": "service_account",
            "project_id": "summongrid",
            "private_key_id": "88bb2bdeefa339957e259f8b7fa9120314a55dc4",
            "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDLizD2VymUE3QR\njtArphRhyq+h/GQEQs9HNhF5FJni4CWMDBakCfH50+cArdcpDLajzBMTwp3zPQyb\nkis61KdrkFBnTLjJGxtCcULv9pXncnDjw0rK59+HB/xlQqbIOuqhycAQ+TTaRF5E\nH3o805XfNByKO9qvlms998S4H+WYNBH+xPDDCAMH1FFWZX/d0M3ofvDzJMlR6LkV\nqVFGKpr1sizZxc1WQHWerBzpCn5g+osSIpcNlw2VHN9Gv1ctoXIoqFU7kLXZ1PPk\n+YU2FACMxiBL4ApJXCoiJJPCavKZ8Xr88hZs5TWk8p7ml0RfURdXj6V0JY4hp+Vl\nH4YXJAwxAgMBAAECggEACxPwR2W0wQlAS117mT/9UJCmUwTqsTCtGZ+o2qYqGfAb\nZC4tZCJ0JZORuUjhaYcbCZ8neFz+GXJhJ5HZk+avA7OsvuA/PBdaJ+JyMQ05fa4g\nQjLiPg+1NP55IZdyfp6/aKyBLUa+WsvpNYCFpXnZ+uPsUt5Dp40ZYkBNWAXI+AVN\nq37c94HU7uyvO1uAyFRbJGZ/HpSqvvAMBnccuGZ9egU33o0NgEfZjJ3GxOslAvmh\nNBECrFBZQdUVKdiFQ6bcgt4CjyeywsgkIyqLiclg0Ys/2vM9qTcY0/JOZBh8x/O/\ndgrxcTERebk10hmKD+60DgA/Kgp43sqUNg54u4kBYQKBgQD55jmvRr3ye76lkrxt\nvkCRTyHbnxiJtjPI35V7WW2djq2CG7vMKgRSSDBBeTPBuY54Qo0zfCgHrEY426qw\n4SjKyQc8uakTbCgYFOk+bAHNhQhCEkmwgemzg3I9HZMpD9Gut4q0H6RTd7XuqMqK\nknggeLmL1gWkAqJjVlcGYpa9+wKBgQDQg0LgZyGNvr30Wnje/iN37k5P8JudbqOA\nG5qzwVzYSly1TJLHC151CtK5h/sZeijsV6sNTkjPSdRC6ra2fHzoS5ko86zuXp7T\n8nHQsMhamkZB2blU3amaABTYxKrGTxw7H1XzG3K6MbhANCqsfRB0hfDML5oBPlqE\nOhBbjWIiwwKBgE7mlcf1efuZfnQghEXSD+jRJ0uES+cPFAKUNUogzi804St3PjAU\nBBFGoZXKgsDjqUvnF1XuGWVyyykgkiAOtyZvmk1eATgUqgQQdiQzTc5p9lWGGKYW\nHoeDNQp+z/vi9r1HTg/Y/bUs0tBrkqd131/BPjQceuNxwXvDwu5NKnMJAoGBAK2W\nmXZ4ZVa8FSf4qef7a0vM+SVUCjlmgneEg6ZitAjc35GPziInNNv7xrLuofzz1l3s\nHltVcQghTrTm8nW57cL2LOwK8U0BOPj6PgafJi1HgnYP7FrarvemWbSdBg9SjQ4r\naEKb90dLXTkWNPCkra5UU8OpXWzrnC+4pyWQ7sJBAoGARDZi8ZyuaLvu7ZiubjZW\nFQhJdxjmm5SdVWnK9b04pp4PDAP52kDKfoT1CZKb7UiD0CECNt3RspEp9Vv2lbsP\n9MckK+zmRsVerVX9YAqDzWgHKED4WNbJFXOTlm/VdQl5KsM7OYVnY/mTPYIhx/b+\nYwaJZn5wKDAaLv4TnYOagDo=\n-----END PRIVATE KEY-----\n",
            "client_email": "firebase-adminsdk-d9ivs@summongrid.iam.gserviceaccount.com",
            "client_id": "103226061439357252567",
            "auth_uri": "https://accounts.google.com/o/oauth2/auth",
            "token_uri": "https://oauth2.googleapis.com/token",
            "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
            "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-d9ivs%40summongrid.iam.gserviceaccount.com"
        }'
          

		@firebase = Firebase::Client.new(base_url, json_private_key)
	end

end
