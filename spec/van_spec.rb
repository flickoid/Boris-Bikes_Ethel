require 'van'

describe Van do

let(:broken_bike)  { double :bike, broken?: true, is_a?: true  }
let(:working_bike) { double :bike, broken?: false, is_a?: true }
let(:van)		   { Van.new(:capacity => 30)                 }


	it "should be able to collect broken bikes" do
		station = double :station
		expect(station).to receive(:release).with(broken_bike)
		expect(station).to receive(:broken_bikes).and_return([broken_bike])
		van.collect_broken_bikes(station)
		expect(van.broken_bikes).to eq [broken_bike]
	end

	it "should be able to drop off broken bikes" do
		van.dock(broken_bike)
		garage = double :garage
		expect(garage).to receive(:dock).with(broken_bike)
		van.drop_off_broken_bikes(garage)
		expect(van.broken_bikes).to eq []
	end

	it "should be able to collect working bikes from the garage" do
		garage = double :garage
		expect(garage).to receive(:available_bikes).and_return([working_bike])
		expect(garage).to receive(:release).with(working_bike)
		van.collect_working_bikes(garage)
		expect(van.available_bikes).to eq [working_bike]
	end

	it "should be able to drop off fixed bikes" do
		van.dock(working_bike)
		station = double :station
		expect(station).to receive(:dock).with(working_bike)
		van.drop_off_working_bikes(station)
		expect(van.available_bikes).to eq []
	end
end
