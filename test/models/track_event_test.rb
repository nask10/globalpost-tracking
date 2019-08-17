require 'test_helper'

class TrackEventTest < ActiveSupport::TestCase
  test 'valid TrackEvent' do
    parcel = ::FactoryBot.create :parcel
    track_event = TrackEvent.new(parcel_id: parcel._id.to_s, location: 'Dublin', description: 'A description')
    assert track_event.valid?
  end
end

