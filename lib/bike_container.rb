module BikeContainer

	DEFAULT_CAPACITY = 10
	attr_writer :capacity

	def bikes
		@bikes ||= []
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def bike_count
		bikes.count
	end

	def dock(bike = nil)
		raise "Station is full" if full?
		raise "You must select a bike to dock" if bike == nil
		raise "Sorry, I can only dock bikes" unless bike.is_a? Bike
		bikes << bike
	end

	def release(bike = nil)
		raise "No bike is selected" if bike == nil
		raise "Station is empty" if empty?
		bikes.delete(bike)
	end

	def full?
		bike_count == capacity
	end

	def available_bikes
		bikes.reject { |bike| bike.broken? }
	end

	def broken_bikes
		bikes.select { |bike| bike.broken? }
	end

	def empty?
		bike_count == 0 
	end
end



