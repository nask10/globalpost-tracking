FactoryBot.define do
    factory :user do
      email { 'admin@globalpost.com' }
      password { 'password' }
    end
  
    factory :address do
      street { 'Test St' }
      ext_number { '123' }
      int_number { '456' }
      city { 'City' }
      country { 'Country' }
    end
  
    factory :parcel do
      user_id { ::FactoryBot.create(:user)._id }
      origin_address_id { ::FactoryBot.create(:address)._id }
      destination_address_id { ::FactoryBot.create(:address)._id }
      status { 'Added to system' }
    end
  end