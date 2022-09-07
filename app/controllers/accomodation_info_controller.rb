class AccomodationInfoController < ApplicationController

    def create 
        @accomodation_info = Accomodation_infos.new(accomodation_info_params)
        raise
        @wedding = Wedding.find(params[:wedding_id])
        @accomodation_info.wedding_id = @wedding.id
        @accomodation_info.save
        redirect_to accomodation_infos_path(@accomodation_info)
    end

    def new
        @accomodation_info = Accomodation_info.new

    end

    def index
        @accomodation_info = Accomodation_info.all

    end

    def show
        @accomodation_info = Accomodation_info.find

    end

    private

    def accomodation_info_params
        params.require(:accomodation_info).permit(:url, :title, :description)

end
