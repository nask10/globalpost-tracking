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
    
    end
    
end