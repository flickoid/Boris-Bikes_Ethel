require 'garage'

describe Garage do

	let(:garage) {Garage.new(:capacity => 250)}

	it "should be able to fix broken bikes" do
		broken_bike = double :bike, broken?: true, is_a?: true
		allow(broken_bike).to receive(:fix!)
		garage.dock(broken_bike)
		expect(garage.available_bikes).to eq(garage.bikes)
	end
end