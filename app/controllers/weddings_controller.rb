class WeddingsController < ApplicationController
  def index
    @weddings = Wedding.all
  end

  def show
    @wedding = Wedding.find(params[:id])
  end

  def new
    @wedding = Wedding.new
  end

  def create
    @wedding = Wedding.new(wedding_params)
    @wedding.user_id = current_user.id

    if @wedding.save
      # raise
      redirect_to wedding_path(@wedding)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def wedding_params
    params.require(:wedding).permit(:info, :date, :page_heading)
  end
end