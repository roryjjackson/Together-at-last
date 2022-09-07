class SchedulesController < ApplicationController
  def new
    @wedding = Wedding.find(params[:wedding_id])
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @wedding = Wedding.find(params[:wedding_id])
    @schedule.wedding_id = @wedding.id
    # raise
    if @schedule.save
      redirect_to wedding_path(@schedule)
      raise
    else
      render :new, status: :unprocessable_entity
    end
  end
  # def index
  #   @schedules = Schedule.all
  # end

  # def show
  #   @schedules = Schedule.find
  # end
  private

  def schedule_params
    params.require(:schedule).permit(:time, :description)
  end
end
