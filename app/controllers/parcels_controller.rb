class ParcelsController < ApplicationController
    def index
        @parcels = Parcel.all
    end

    def show
        @parcel = Parcel.find_by id: params[:id]
        @origin_address = Address.find_by id: @parcel.origin_address_id
        @destination_address = Address.find_by id: @parcel.destination_address_id
    end

    def update_status
        @parcel = Parcel.find_by id: params[:id]
        if @parcel.update_track_history
            message = 'Track history updated'
        else
            message = 'There was an error'
        end
        redirect_to parcel_path, notice: message
    end
end
