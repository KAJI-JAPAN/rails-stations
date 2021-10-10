class SheetsController < ApplicationController
  def index
    @sheets = Sheet.all
    @date = params[:date]
    @movie_id = params[:movie_id]
    @schedule_id = params[:schedule_id]
  end
end
