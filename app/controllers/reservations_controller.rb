class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
    @date = params[:date]
    @movie_id = Movie.find(params[:movie_id])
    @schedule_id = params[:schedule_id]
    @sheet_id = params[:sheet_id]
  end

  def create
    @reservation = Reservation.new({name: reservation_params[:name], email: reservation_params[:email], date: reservation_params[:date], sheet_id: reservation_params[:sheet_id], schedule_id: reservation_params[:schedule_id]})

    if @reservation.save
      redirect_to movies_path
    else
      # @movie_id = Movie.find(reservation_params[:schedule_id]).id
      redirect_to movie_schedule_sheets_path(schedule_id: reservation_params[:schedule_id], movie_id: reservation_params[:movie_id], date: reservation_params[:date]), status: 400
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:name, :email, :date, :sheet_id, :schedule_id, :movie_id)
  end
end
