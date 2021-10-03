class MoviesController < ApplicationController

  # GET /admin/movies
  def index
    @movies = Movie.all 
  end

  # GET /admin/movies/new
  def new
    @movie = Movie.new
  end

  # POST /admin/movies/
  def create
    @movie = Movie.new(post_params)
    if @movie.save 
      redirect_to movies_path	, notice: 'Movie created'
    else 
      render :new
    end 
  end

  # GET /admin/movies/1/edit
  def edit
    @movie = Movie.find(params[:id])
  end

  # PATCH|PUT /admin/movies/1
  def update
    @movie = Movie.find(params[:id])   
    if @movie.update(post_params)
      redirect_to movies_path, notice: 'Movie updated' 
    else
      render :edit
    end
  end

  def search
    unless  search_params[:search_radio] == "all"
      @movies = Movie.search(search_params)
    else
      @movies = Movie.allresults(search_params)
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @schedule = @movie.schedule.find(@movie.id)
  end


  private

  def post_params
    params.require(:movie)
    .permit(
      :id, :name, :year, 
      :image_url, :description, :is_showing 
    )
  end

  def search_params
    params.require(:movie).permit(:search,:search_radio)
  end
end