class BroadcastUpdateJob < ApplicationJob
  queue_as :default

  def perform(track_event_id)

    track_event = TrackEvent.find track_event_id

    GlobalPost::HTTP.update_parcel_status(
      track_event.parcel,
      track_event.location,
      track_event.description
    )

    GlobalPost::Notification::HTTP.create_notification(
      track_event.parcel,
      track_event.location,
      track_event.description
    )
  end
end
