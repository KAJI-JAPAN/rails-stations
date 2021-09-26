class Movie < ApplicationRecord
	# enum is_showing: { unpublished: 0, published: 1 }

	def self.search(search_params)
		if search_params
			@movie = Movie.where( 'is_showing LIKE ?', "%#{search_params[:search_radio]}%" )
			@movie.where( 'name LIKE ?', "%#{ search_params[:search] }%" )
		else
			Movie.all
		end
	end

	def self.allresults(search_params)
		if search_params
			Movie.where( 'name LIKE ?', "%#{ search_params[:search] }%" )
		else
			Movie.all
		end
	end
end
