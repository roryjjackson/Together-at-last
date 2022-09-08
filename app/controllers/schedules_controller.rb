class SchedulesController < ApplicationController
  def new
    @wedding = Wedding.find(params[:wedding_id])
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @wedding = Wedding.find(params[:wedding_id])
    @schedule.wedding = @wedding
    if @schedule.save!
      redirect_to wedding_schedules_path(@wedding)
    else
      render :new, status: :unprocessable_entity
    end
  end
  def index
    @wedding = Wedding.find(params[:wedding_id])
    @schedules = Schedule.all
    end

  def destroy
    @schedules = Schedule.delete
    end
#   def show
#     @schedules = Schedule.all
#   end
  private

  def schedule_params
    params.require(:schedule).permit(:time, :description)
  end
end
