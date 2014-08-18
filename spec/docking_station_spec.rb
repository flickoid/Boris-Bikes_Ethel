require 'docking_station'

describe DockingStation do 

let(:station) { DockingStation.new }
let(:bike)    { double :bike       } 
	
	it "should accept a bike" do
		expect(station.bike_count).to eq 0
		station.dock(bike)
		expect(station.bike_count).to eq 1
	end

	it 'should release a bike' do 
		station.dock(bike)
		station.release(bike)
		expect(station.bike_count).to eq 0
	end

end


