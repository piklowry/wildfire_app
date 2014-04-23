class WildfiresController < ApplicationController

	def index
		@wildfires = Wildfire.all
	end

	def new
		@new_fire = Wildfire.new
	end

	def create
		@new_fire = Wildfire.new(wildfire_params)
		if @new_fire.save
			redirect_to wildfires_path  
		else
			redirect_to new_fire_path
		end
	end
	
	def change_death_toll
		@wildfire = Wildfire.find(params[:id])

		if @wildfire.death_toll
			val = "yes"
	  else
			val = "no"
	  end
	  @wildfire.update_attributes(:death_toll => val)
		redirect_to wildfires_path
	end

	def search
	  @search_results = Wildfire.search(params[:search])
		render results_wildfires_path
  end
 

	def results
		@search_results
	end



	private

	def wildfire_params
		params.require(:wildfire).permit!
	end

end