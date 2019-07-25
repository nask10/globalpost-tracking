class TrackEvent < ApplicationRecord

    EVENTS_LIST = [
        'Package left origin city facility towards airport', # location: origin city
        'Package has arrived to origin airport facility', # location: origin city
        'Package has left origin city', # location: origin city
        'Package has arrived to destination city', # location: destination city
        'Package has left destination city airport facility', # location: destination city
        'Package has arrived to destination city facility', # location: destination city
        'Package has left destination city facility for delivery', # location: destination city
        'Package has been delivered' # location: destination city
    ]

    belongs_to :parcel

    after_create :broadcast_update

    def broadcast_update
        GlobalPost::HTTP.update_parcel_status(
            parcel,
            location,
            description
        )

        GlobalPost::Notification::HTTP.create_notification(
            parcel,
            location,
            description
        )
    end
end