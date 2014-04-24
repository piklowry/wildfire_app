class Wildfire < ActiveRecord::Base
		has_many :locations


	# def self.search(search)
 #  if search
 #    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
 #  else
 #    find(:all)
 #  end
 # end

 ##scopes ##
	# scope :bigwildfires -> { where('acres_burned >= ?', 100,000)}
	scope :casualties, -> {where(death_toll: false )	}
	scope :with_acres_burned, -> (acres_burned) { where('acres_burned = ?', acres_burned)}


	def self.with_acres_burned(acres_burned)
		# if acres_burned.blank? - i could do logic in here if i want
		where('locations.acres_burned LIKE ?', acres_burned)
	end

	def self.search(params)
		# debugger
		name = params[:name]
		acres_burned = params[:acres_burned]
		


		search = Wildfire.all


		# if acres_burned.present?
  #   	search = search.with_acres_burned(acres_burned)
  #   end

    # if acres_burned.present?
    # 	search = search.joins(:locations).where('locations.state LIKE ?',"%#{name}%")
    # end

    if name.present?
    	# search = search.where('name LIKE ?', "%#{name}%")
    	search = search.joins(:locations).where('locations.city LIKE ?', "%#{name}%")
		end

		search
	end



end



