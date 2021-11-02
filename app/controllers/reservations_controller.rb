class ReservationsController < ApplicationController

  def new
      @reservation = Reservation.new
      @movie_id = Movie.find(params[:movie_id])
      @schedule_id = params[:schedule_id]
      @date = params[:date]
      @sheet_id = params[:sheet_id]
     if (@date.nil?) || (@sheet_id.nil?)
      render status: 400
     else
      render status: 200
     end
  end

  def create
    @reservation = Reservation.new(name: reservation_params[:name], email: reservation_params[:email], date: reservation_params[:date], sheet_id: reservation_params[:sheet_id], schedule_id: reservation_params[:schedule_id])

    if @reservation.save
      redirect_to movies_path
    else 
      redirect_to movie_schedule_sheets_path(schedule_id: reservation_params[:schedule_id], movie_id: reservation_params[:movie_id], date: reservation_params[:date])
    end
  end

  private
    def reservation_params
      params.require(:reservation).permit(:name, :email, :date, :sheet_id, :schedule_id, :movie_id)
    end
end
