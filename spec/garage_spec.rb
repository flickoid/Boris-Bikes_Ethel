require 'garage'

describe Garage do

	it "should be able to fix broken bikes" do
		garage = Garage.new
		broken_bike = double :bike, broken?: true, is_a?: true
		allow(broken_bike).to receive(:fix!)
		garage.dock(broken_bike)
		expect(garage.available_bikes).to eq(garage.bikes)
	end

end