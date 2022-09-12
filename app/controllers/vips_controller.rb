class VipsController < ApplicationController
  def new
    @wedding = Wedding.find(params[:wedding_id])
    @vip = Vip.new
  end

  def create
    @vip = Vip.new(vip_params)
    @wedding = Wedding.find(params[:wedding_id])
    @vip.wedding = @wedding
    if @vip.save
      redirect_to wedding_vips_path(@wedding)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @wedding = Wedding.find(params[:wedding_id])
    @bridesmaids = Vip.where(category: "Bridesmaid")
    @groomsmen = Vip.where(category: "Groomsman")
    @pgroom = Vip.where(category: "Parent of the groom")
    @pbride = Vip.where(category: "Parent of the bride")
  end

  def edit
    # @wedding = Wedding.find(params[:wedding_id])
    @vip = Vip.find(params[:id])
  end

  def update
    @vip = Vip.find(params[:id])
    @vip.update(vip_params)
    # raise
    redirect_to wedding_vips_path(:wedding_id)
  end

  def destroy
    # raise
    # @wedding = Wedding.find(params[:wedding_id])
    @vip = Vip.find(params[:id])
    @vip.destroy
    redirect_to wedding_vips_path(:wedding_id)
    # raise
  end

#   def show
#     @vips = vip.all
#   end

  private

  def vip_params
    params.require(:vip).permit(:time, :description, :name, :category, :photo)
  end
end
