class Location < ActiveRecord::Base
	belongs_to :wildfire
	
	mount_uploader :fire_zone, FireZoneUploader
end


