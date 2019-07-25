module GlobalPost
    class HTTP
        include HTTParty

        base_uri 'http://localhost:3000'

        def self.update_parcel_status(parcel, location, description)
            post(
                '/api/track_events',
                headers: {
                    'X-GLOBALPOST-SYS' => 'foo'
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