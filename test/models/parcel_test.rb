require 'test_helper'

class ParcelTest < ActiveSupport::TestCase
  test "#origin_address" do
    parcel = Parcel.create(
                       user_id: User.create(email: 'test@mail.com', password: 'password'),
                       origin_address_id: Address.create(
                                                  street: 'Origin Street',
                                                  ext_number: '123',
                                                  int_number: '234',
                                                  city: 'Origin City',
                                                  country: 'Origin Country')._id,
                       destination_address_id: Address.create(
                                                  street: 'Destination Street',
                                                  ext_number: '123',
                                                  int_number: '234',
                                                  city: 'Destination City',
                                                  country: 'Destination Country')._id,
                       receiver_name: 'Jane',
                       receiver_email: 'test.2@mail.com'
    )

    assert parcel.origin_address, 'Origin Street 123 234, Origin City, Origin Country'
  end

  test "#destination_address" do
    parcel = Parcel.create(
        user_id: User.create(email: 'test@mail.com', password: 'password'),
        origin_address_id: Address.create(
            street: 'Origin Street',
            ext_number: '123',
            int_number: '234',
            city: 'Origin City',
            country: 'Origin Country')._id,
        destination_address_id: Address.create(
            street: 'Destination Street',
            ext_number: '123',
            int_number: '234',
            city: 'Destination City',
            country: 'Destination Country')._id,
        receiver_name: 'Jane',
        receiver_email: 'test.2@mail.com'
    )

    assert parcel.destination_address, 'Destination Street 123 234, Destination City, Destination Country'
  end
end

