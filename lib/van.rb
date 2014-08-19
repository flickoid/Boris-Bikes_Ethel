require_relative 'bike_container'

class Van

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

	def collect_broken_bikes(station)
		station.broken_bikes.each do |bike|
			station.release(bike)
			self.dock(bike)
		end
	end

	def drop_off_broken_bikes(garage)
		self.broken_bikes.each do |bike|
			self.release(bike)
			garage.dock(bike)
		end
	end

	def collect_working_bikes(garage)
		garage.available_bikes.each do |bike|
			garage.release(bike)
			self.dock(bike)
		end
	end

	def drop_off_working_bikes(station)
		self.available_bikes.each do |bike|
			self.release(bike)
			station.dock(bike)
		end
	end
end