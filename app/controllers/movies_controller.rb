class MoviesController < ApplicationController

	def index
		@movie = Movie.all
	end

	# def new
	# 	@movie = Movie.new(post_params)
	# end

	# private
	# 	def post_params
	# 		params.params.require(:post).permit(:title, :author, :image, post_items_attributes: post_item_params)
	# 	end
end
