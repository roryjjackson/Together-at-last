class RsvpsController < ApplicationController
  def index
    @wedding = Wedding.find(params[:wedding_id])
    @rsvps = Rsvp.where(wedding_id: @wedding.id)
    @rsvp_yes = @rsvps.where(attendance: "Yes").order("created_at desc")
    @rsvp_no = @rsvps.where(attendance: "No").order("created_at desc")
    @total_participants = 0
    @rsvps.each do |rsvp|
      @total_participants += 1 if rsvp.attendance == "Yes"
    end

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
      redirect_to wedding_rsvps_path(@wedding)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def rsvp_params
    params.require(:rsvp).permit(:meal_choice, :spotify_song, :attendance, :attendee)
  end
end
