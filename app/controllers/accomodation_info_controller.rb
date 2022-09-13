class AccomodationInfoController < ApplicationController
  before_action :set_wedding, only: [ :new, :index, :show ]
  def create
    @accomodation_info = AccomodationInfo.new(accomodation_info_params)
    @wedding = Wedding.find(params[:wedding_id])
    @accomodation_info.wedding_id = @wedding.id
    @accomodation_info.save
    redirect_to accomodation_infos_path(@accomodation_info)
  end

  def new
    @accomodation_info = AccomodationInfo.new
  end

  def index
    @accomodation_info = AccomodationInfo.all
    @markers = @accomodation_info.geocoded.map do |accomodation|
      {
        lat: accomodation.latitude,
        lng: accomodation.longitude
      }
    end
  end

  def show
    @accomodation_info = AccomodationInfo.find(params[:id])
  end

  private

  def set_wedding
    @wedding = Wedding.find(params[:wedding_id])
  end

  def accomodation_info_params
    params.require(:accomodation_info).permit(:url, :title, :description)
  end
end
