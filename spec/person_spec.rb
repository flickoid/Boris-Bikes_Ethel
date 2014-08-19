require 'person'

describe Person do

	let(:bike)             { Bike.new         }
	let(:person)           { Person.new       }
	let(:station)          { double :station  }
	let(:person_with_bike) { Person.new(bike) }

	it "should not have a bike when created" do
		expect(person).not_to have_bike
	end

	it "can have a bike" do
		expect(person_with_bike).to have_bike
	end

	it "can rent a bike" do
		allow(station).to receive(:available_bikes).and_return([bike])
		person.rent_bike_from(station)
		expect(person).to have_bike
	end

	it "can return a bike" do
		allow(station).to receive(:dock).with(bike)
		person_with_bike.return_bike_to(station)
		expect(person).not_to have_bike
	end

	it "can break a bike" do
		person_with_bike.hit_tree
		expect(bike).to be_broken
	end

end
