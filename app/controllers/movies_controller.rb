class MoviesController < ApplicationController

	def index
		@movie = Movie.all
	end

	def new
		@movie = Movie.new
	end

	def create
		@movie = Movie.new(post_params)
		@movie.save!
	end

	private
		def post_params
			params.require(:movie).permit(:name, :year, :image_url, :description, :is_showing )
		end
end
