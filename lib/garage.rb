require_relative 'bike_container'

class Garage

	include BikeContainer

	def dock(bike)
		bike.fix!
		'super'
	end

end