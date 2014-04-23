class Wildfire < ActiveRecord::Base
		has_many :locations


	def self.search(search)
  if search
    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  else
    find(:all)
  end
 end
end



