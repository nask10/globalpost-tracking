require 'test_helper'

class AddressTest < ActiveSupport::TestCase

  test 'valid Address' do
    address = Address.new(ext_number: '1', int_number: '4', city: 'dublin', country: 'ireland', zip_code: '15')
    assert address.valid?
  end

end





