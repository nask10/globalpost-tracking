require 'test_helper'

class ParcelsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    DatabaseCleaner.clean
    user = ::FactoryBot.create(:user)
    sign_in user
  end

  test '#index' do
    idx = 1
    3.times do
      ::FactoryBot.create(:parcel, user_id: ::FactoryBot.create(:user, email: "user.#{idx}@mail.com")._id.to_s)
      idx += 1
    end
    get '/parcels'
    assert_response :success
    assert assigns[:parcels].length, 3
  end

  test '#show' do
    parcel = ::FactoryBot.create(:parcel, user_id: ::FactoryBot.create(:user, email: 'user@mail.com')._id.to_s)
    get '/parcels/' + parcel._id
    assert_response :success
  end

 
  test '#update_status' do
    parcel = ::FactoryBot.create(:parcel,
      user_id: ::FactoryBot.create(:user, email: 'user@mail.com')._id.to_s,
      status: 'Package left origin city facility towards airport')
    get '/parcels/' + parcel._id + '/update_status'

    assert_response :redirect
    assert assigns[:parcel].status, 'Package has arrived to origin airport facility'
  end
end