class MoviesController < ApplicationController
	def index
		@sample = Sample.all
	end
end
