namespace :parcel do
    namespace :tracking do

        desc 'Perform parcel tracking updates'
        task perform: :environment do
            
            Rails.logger.info 'Checking 3rd party services (mocked action) for updates...'

            Parcel.where.not(status: 'delivered').each do |parcel|
                latest_update = parcel.track_events.order(updated_at: :desc).first
                if latest_update
                    position_index = TrackEvent::EVENTS_LIST.index(latest_update.description)
                    new_event = TrackEvent::EVENTS_LIST[position_index + 1]
                    parcel.track_events.create(
                        location: parcel.detect_location(position_index + 1),
                        description: new_event
                    )

                    # Check if package has arrived to the final update
                    if position_index + 1 == TrackEvent::EVENTS_LIST.length - 1
                        parcel.update status: 'delivered'
                    end
                else
                    parcel.track_events.create(
                        location: parcel.detect_location(0),
                        description: TrackEvent::EVENTS_LIST.first
                    )
                end
            end

        end
    end
end
