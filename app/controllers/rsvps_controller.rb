class RsvpsController < ApplicationController
  def index
    @rsvps = Rsvp.all
    # raise
  end

  def show
    @rsvp = Rsvp.find(params[:id])
  end

  def new
    @rsvp = Rsvp.new
  end

  def create
    @rsvp = Rsvp.new(rsvp_params)
    # raise
    @rsvp.wedding_guests_id = current_user.id
    @rsvp.save
    # if @rsvp.save
      redirect_to root_path(@rsvp)
      raise
    # else
    #   render :new, status: :unprocessable_entity
    # end
  end

  # def edit
  # end

  # def destroy
  # end

  # def update
  # end

  private

  def rsvp_params
    params.require(:rsvp).permit(:meal_choice, :spotify_song, :attendance, :attendee)
  end
end
