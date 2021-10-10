class Movie < ApplicationRecord
  has_many :schedules, dependent: :destroy
  enum is_showing: { unpublished: 0, published: 1 }

  def self.search(search_params)
    
    if search_params
      @movie = Movie.where(is_showing: search_params[:search_radio])
      @movie.where( 'name LIKE ? OR description LIKE ?', "%#{ search_params[:search] }%", "%#{ search_params[:search] }%" )
    else
      Movie.all
    end
  end

  def self.allresults(search_params)
    if search_params
      Movie.where( 'name LIKE ? OR description LIKE ?', "%#{ search_params[:search] }%", "%#{ search_params[:search] }%" )
    else
      Movie.all
    end
  end
end
