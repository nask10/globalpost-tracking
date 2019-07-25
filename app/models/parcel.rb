class Parcel < ApplicationRecord
    has_many :track_events

    def origin_address
        address = Address.find(origin_address_id)
        "#{address.street} #{address.ext_number} #{address.int_number}, #{address.city}, #{address.country}"
    end

    def destination_address
        address = Address.find(destination_address_id)
        "#{address.street} #{address.ext_number} #{address.int_number}, #{address.city}, #{address.country}"
    end

    def detect_location(position_index) # position_index in TrackEvent::EVENTS_LIST
        if position_index < 3
            address = Address.find(origin_address_id)           
        else
            address = Address.find(destination_address_id)
        end
        "#{address.city}, #{address.country}"
    end

    def current_status
        latest_update = track_events.order(updated_at: :desc).first
        if latest_update
            position_index = TrackEvent::EVENTS_LIST.index(latest_update.description)
            new_event = TrackEvent::EVENTS_LIST[position_index + 1]
            return {
                position_index: position_index,
                new_event: new_event
            }
        else
            return {
                position_index: 0,
                new_event: TrackEvent::EVENTS_LIST.first
            }
        end
    end

    def update_track_history
        latest_update = track_events.order(updated_at: :desc).first
        if latest_update
            position_index = TrackEvent::EVENTS_LIST.index(latest_update.description)
            new_event = TrackEvent::EVENTS_LIST[position_index + 1]
            track_events.create(
                location: detect_location(position_index + 1),
                description: new_event
            )

            # Check if package has arrived to the final update
            if position_index + 1 == TrackEvent::EVENTS_LIST.length - 1
                update status: 'delivered'
            end
        else
            track_events.create(
                location: detect_location(0),
                description: TrackEvent::EVENTS_LIST.first
            )
        end
    end
end
