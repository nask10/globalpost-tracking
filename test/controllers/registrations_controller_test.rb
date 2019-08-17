require 'test_helper'

class ParcelsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

    test 'user signup' do
        last_count = User.count
        user_params = { user: { email: 'test.user@mail.com', password: 'some password' }}
        post '/users', params: user_params
        assert :redirect
        assert User.count, last_count + 1
    end

end