class LocationsController < ApplicationController

	def index
		@locations = Location.all
	end

	def new
		@new_location = Location.new
	end

	def create
		@new_location = Location.new(location_params)
		if @new_location.save
		redirect_to locations_path
	end
end

	
	def show
		@location = Location.find(params[:id])
	end

	def download_fire_zone
		@location = Location.find(params[:id])
		file = @location.fire_zone
		send_file file.path
	end

	private

	def location_params
		params.require(:location).permit!
	end
end

