require 'docking_station'

describe DockingStation do 

let(:station)      { DockingStation.new(:capacity => 20) }
let(:bike)         { double :bike                        } 
let(:working_bike) { double :bike, broken?: false        }
let(:broken_bike)  { double :bike, broken?: true	     }
	
	def fill_station(station)
		20.times { station.dock(bike) }
	end

	it "should accept a bike" do
		expect(station.bike_count).to eq 0
		station.dock(bike)
		expect(station.bike_count).to eq 1
	end

	it "should release a bike" do 
		station.dock(bike)
		station.release(bike)
		expect(station.bike_count).to eq 0
	end

	it "should know when it's full" do 
		expect(station).not_to be_full
		fill_station(station)
		expect(station).to be_full
	end

	it "should not accept a bike if it's full" do
		fill_station(station)
		expect(-> { station.dock(bike) }).to raise_error(RuntimeError)
	end

	it "should provide the list of available bikes" do
		station.dock(working_bike)
		station.dock(broken_bike)
		expect(station.available_bikes).to eq([working_bike])
	end


	
end


