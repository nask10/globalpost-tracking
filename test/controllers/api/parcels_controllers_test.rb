require 'test_helper'

class Api::ParcelsControllerTest < ActionDispatch::IntegrationTest
    setup do
        DatabaseCleaner.clean
    end

    test 'Create parcel via API' do
        le_params = {
            parcel: {
            user_id: ::FactoryBot.create(:user, email: 'test.user@mail.com')._id,
            receiver_name: 'Receiver',
            receiver_email: 'receiver@mail.com'
        },
        origin_address: {
            street: 'Origin St',
            ext_number: '1',
            int_number: '2',
            city: 'Origin City',
            country: 'Origin Country'
        },
        destination_address: {
            street: 'Destination St',
            ext_number: '1',
            int_number: '2',
            city: 'Destination City',
            country: 'Destination Country'
        }
        }
        post '/api/parcels',
            headers: {
                'X-GLOBALPOST-SYS' => ENV['GLOBALPOST_APP_KEY']
            },
            params: le_params
        assert_response :success
    end    

end