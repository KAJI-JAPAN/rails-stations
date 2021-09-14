class SamplesController < ApplicationController
	def index
		@sample = Sample.all
	end

end
