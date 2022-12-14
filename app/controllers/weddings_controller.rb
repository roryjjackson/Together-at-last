class WeddingsController < ApplicationController

  def index
    @weddings = Wedding.all
  end

  def show
    @wedding = Wedding.find(params[:id])
    @wedding_guest = WeddingGuest.new
  end

  def new
    @wedding = Wedding.new
  end

  def create
    @wedding = Wedding.new(wedding_params)
    @wedding.user_id = current_user.id

    if @wedding.save
      # raise
      redirect_to weddings_path(@wedding)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @wedding = Wedding.find(params[:id])
  end

  def update
    @wedding = Wedding.find(params[:id])
    new_photos = wedding_params[:photos]
    @wedding.photos.attach(new_photos)
    @wedding.save
    # @wedding.photos.push(wedding_params[:photos])
    redirect_to wedding_path(@wedding)
  end

  private

  def wedding_params
    params.require(:wedding).permit(:info, :date, :page_heading, photos: [] )
  end

end
