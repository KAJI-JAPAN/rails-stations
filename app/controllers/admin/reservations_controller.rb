class Admin::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.joins(schedule: :movie).select("schedules.*, reservations.*, reservations.id AS reservations_id, movies.*")
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(name: reservation_params[:name], email: reservation_params[:email], sheet_id: reservation_params[:sheet_id], schedule_id: reservation_params[:schedule_id])
   if (@reservation.name?) && (@reservation.email?) && (@reservation.sheet_id?) && (@reservation.schedule_id?)
   elsif @reservation.save!
    redirect_to admin_reservations
   else
    render status: 400 
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    @get_movie_id = Schedule.find(@reservation.schedule_id)
    
    if (@reservation.nil?) && (@get_movie_id.nil?)
      render status: 400
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
      params.require(:reservation).permit(:name, :email, :sheet_id, :schedule_id, :movie_id)
    end
end
