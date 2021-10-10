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
    if @reservation.save
      redirect_to movies_path
    else
      redirect_to new_movie_schedule_reservation_path
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:name, :email, :date, :sheet_id, :schedule_id )
  end

end
