class SchedulesController < ApplicationController
  def index
    @movies = Movie.joins(:schedules).select("movies.*", "schedules.*")
  end

  def new
    @movie = Movie.find(params[:movie_id])
    @schedule = @movie.schedules.build
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @schedule = @movie.schedules.create(schedule_params)
    redirect_to schedules_path
  end

  def edit
    @movie = Movie.find(params[:movie_id])
    @schedule = @movie.schedules.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:movie_id])
    @schedule = @movie.schedules.find(params[:id])
    @schedule.update(schedule_params)
    redirect_to schedules_path
  end

  def show
    @movie = Movie.find(params[:id])
    @schedule = @movie.schedules.find(@movie.id)
  end

  def destroy
    @movie = Movie.fins(params[:id])
    @movie.destroy
  end
  private
    def schedule_params
      params.require(:schedule).permit(:start_time, :end_time,:movie_id, :id)
    end  
end
 