class Admin::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.joins(:sheet, schedule: :movie).select("schedules.*, reservations.*, reservations.id AS reservations_id, movies.*, sheets.*")
  end

  def new
      @reservation = Reservation.new
      @movie_id = params[:movie_id]
      @schedule_id = params[:schedule_id]
      @date = params[:date]
      @sheet_id = params[:sheet_id]
      @name = params[:name]
      @email = params[:email]
  end

  def create
    @reservation = Reservation.new(reservation_params)
     @reservation.save!
    redirect_to admin_reservations
  end

  def show
    @reservation = Reservation.find(params[:id])
    @get_movie_id = Schedule.find(@reservation.schedule_id)
    
    if (@reservation.nil?) && (@get_movie_id.nil?)
      render admin_reservation_path, status: 400
    else
      render status: 200
    end
  end
  
  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update(reservation_params)
    @reservation.save
    redirect_to admin_reservations_path
  end

  def destroy
    Reservation.find(params[:id]).destroy
    redirect_to admin_reservations_path
  end


  private
    def reservation_params
      params.require(:reservation).permit(:name, :email, :sheet_id, :schedule_id, :date, movie_id: [:movie_id])
    end
end
