class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.joins(:sheet, schedule: :movie).select("schedules.*, reservations.*, reservations.id AS reservations_id, movies.*, sheets.*")
  end


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
      params.require(:reservation).permit(:name, :email, :date, :sheet_id, :schedule_id, :movie_id)
    end
end
