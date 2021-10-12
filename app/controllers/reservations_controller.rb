class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
    @date = params[:date]
    @movie_id = Movie.find(params[:movie_id])
    @schedule_id = params[:schedule_id]
    @sheet_id = params[:sheet_id]
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save && @reservation.valid?
      redirect_to movies_path
    else
      @movie_id = Movie.find(reservation_params[:schedule_id]).id
      redirect_to movie_schedule_sheets_path(schedule_id: reservation_params[:schedule_id], movie_id: @movie_id, date: reservation_params[:date]), status: 400
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:name, :email, :date, :sheet_id, :schedule_id)
  end
end
