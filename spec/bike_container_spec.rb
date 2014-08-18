require 'bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do

let(:holder)       { ContainerHolder.new			           }
let(:bike)         { double :bike, is_a?: true                 } 
let(:working_bike) { double :bike, broken?: false, is_a?: true }
let(:broken_bike)  { double :bike, broken?: true, is_a?: true  }
	
	def fill_holder(holder)
		holder.capacity.times { holder.dock(bike) }
	end

	it "should accept a bike" do
		expect(holder.bike_count).to eq 0
		holder.dock(bike)
		expect(holder.bike_count).to eq 1
	end

	it "should release a bike" do 
		holder.dock(bike)
		holder.release(bike)
		expect(holder.bike_count).to eq 0
	end

	it "should know when it's full" do 
		expect(holder).not_to be_full
		fill_holder(holder)
		expect(holder).to be_full
	end

	it "should not accept a bike if it's full" do
		fill_holder(holder)
		expect(-> { holder.dock(bike) }).to raise_error(RuntimeError)
	end

	it "should provide the list of available bikes" do
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.available_bikes).to eq([working_bike])
	end

	it "should know when it's empty" do 
		expect(holder).to be_empty
	end

	it "should not release a bike when it's empty" do 
		expect(-> { holder.release(bike) }).to raise_error(RuntimeError) if holder.empty?
	end

	it "should warn you if no bike is selected when using release" do
		expect(-> { holder.release }).to raise_error(RuntimeError)
	end

	it "should not accept anything other than a bike" do
		expect(-> { holder.dock(:not_bike) }).to raise_error "Sorry, I can only dock bikes"
	end

	it "should warn you if no bike is selected when using dock" do
		expect(-> { holder.dock }).to raise_error(RuntimeError)
	end



end
