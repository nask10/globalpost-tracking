class Api::ParcelsController < Api::BaseController

    def create
        origin_address = Address.create(origin_address_params)
        destination_address = Address.create(destination_address_params)
        parcel = Parcel.new(parcel_params.merge(origin_address_id: origin_address.id, destination_address_id: destination_address.id))
       # binding.pry
        if parcel.save
            render json: {result: 'Parcel was created'}, status: :ok
        else
            render json: {error_messages: parcel.errors.messages.values.join(', ')}, status: :unprocessable_entity
        end
    end

    protected

    def parcel_params
        params.require(:parcel).permit(:tracking_code, :receiver_name, :receiver_phone, :receiver_email)
    end

    def origin_address_params
        params.require(:origin_address).permit(:street, :ext_number, :int_number, :city, :country, :zip_code)
    end
    
    def destination_address_params
        params.require(:destination_address).permit(:street, :ext_number, :int_number, :city, :country, :zip_code)
    end

end