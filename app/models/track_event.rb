class TrackEvent

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

    include Mongoid::Document
    include Mongoid::Timestamps

    field :parcel_id, type: String
    field :location, type: String
    field :description, type: String
    field :created_at, type: DateTime
    field :updated_at, type: DateTime

    belongs_to :parcel

    after_create :broadcast_update

    def broadcast_update
        BroadcastUpdateJob.perform_later(self._id.to_s) unless Rails.env == 'test'
    end
end