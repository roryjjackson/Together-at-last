class WeddingGuestsController < ApplicationController
  before_action :set_wedding, only: %i[new create]

  def new
    @wedding_guest = WeddingGuest.new
  end

  def create

    @wedding_guest = WeddingGuest.new(wedding_guest_params)
    @wedding_guest.user = current_user
    if @wedding_guest.save

      redirect_to wedding_path(@wedding.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def wedding_guest_params
    params.permit(:wedding_id)
  end

  def set_wedding
    @wedding = Wedding.find(params[:wedding_id])
  end
end
