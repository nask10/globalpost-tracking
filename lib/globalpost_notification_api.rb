module GlobalPost::Notification
    class HTTP
        include HTTParty

        base_uri ENV['GLOBALPOST_NOTIFICATION_URL']

        def self.create_notification(parcel, location, description)
            post(
                '/api/notifications',
                headers: {
                    'X-GLOBALPOST-SYS' => ENV['GLOBALPOST_APP_KEY']
                },
                body: {
                    tracking_code: parcel.tracking_code,
                    location: location,
                    description: description,
                    delivery_status: parcel.status,
                    receiver_email: parcel.receiver_email
                }
            )

        end
    
    end
    
end