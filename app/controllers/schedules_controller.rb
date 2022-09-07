class SchedulesController < ApplicationController

    def create
        @schedule = Schedule.new(schedule_params)
        raise
        @wedding = Wedding.find(params[:wedding_id])
        @schedule.wedding_id = @wedding.id
        @schedule.save
        redirect_to schedules_path(@schedule)
    end

    def index 
        @schedules = Schedule.all
    
    end

    def show 
        @schedules = Schedule.find
    end

    def new
        @schedule = Schedule.new
    end

    private

    def schedule_params
        params.require(:schedule).permit(:time, :description)
    end
end
