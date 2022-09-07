class RsvpsController < ApplicationController
  def index
    @rsvps = Rsvp.all
    # raise
  end

  def show
    @rsvp = Rsvp.find(params[:id])
  end

  def new
    # @wedding_guests_id = WeddingGuest.find(params[:id])
    @wedding = Wedding.find(params[:wedding_id])
    @rsvp = Rsvp.new
    # raise
  end

  def create
    # @wedding_guest = WeddingGuest.find(params[:wedding_guests_id])
    @rsvp = Rsvp.new(rsvp_params)
    @wedding = Wedding.find(params[:wedding_id])
    @rsvp.wedding_id = @wedding.id
    if @rsvp.save
      redirect_to rsvps_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def rsvp_params
    params.require(:rsvp).permit(:meal_choice, :spotify_song, :attendance, :attendee)
  end
end
