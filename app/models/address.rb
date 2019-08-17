class Address
    include Mongoid::Document
    include Mongoid::Timestamps

    field :street, type: String
    field :ext_number, type: String
    field :int_number, type: String
    field :city, type: String
    field :country, type: String
    field :created_at, type: DateTime
    field :updated_at, type: DateTime
    field :zip_code, type: String


end
