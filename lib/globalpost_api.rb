#This is an API client to communicate with micro-service 1
module GlobalPost
    class HTTP
        include HTTParty

        base_uri ENV['GLOBALPOST_URL']

        def self.update_parcel_status(parcel, location, description)
            post(
                '/api/track_events',
                headers: {
                    'X-GLOBALPOST-SYS' => ENV['GLOBALPOST_APP_KEY']
                },
                body: {
                    tracking_code: parcel.tracking_code,
                    location: location,
                    description: description,
                    delivery_status: parcel.status
                }
            )

        end

        def self.create_user(email, password)
            Rails.logger.info "[API client] performing HTTP POST request..."
            post(
                '/api/users',
                headers: {
                    'X-GLOBALPOST-SYS' => ENV['GLOBALPOST_APP_KEY']
                },
                body: {
                    user: {
                        email: email,
                        password: password #,
                        #password_confirmation: user.encrypted_password_confirmation 

                    }
                }
            )
        end

        def self.sync_user(user_id, email, password)
            Rails.logger.info "[API client] performing HTTP PUT request..."
            put(
                "/api/users/#{user_id}",
                headers: {
                    'X-GLOBALPOST-SYS' => ENV['GLOBALPOST_APP_KEY']
                },
                body: {
                    user: {
                        email: email,
                        password: password #,
                        #password_confirmation: user.encrypted_password_confirmation

                    }
                }
            )

        end
    
    end
    
end