require './lib/docking_station'

describe DockingStation do

  it { is_expected.to be_instance_of DockingStation}
  it { is_expected.to respond_to('dock_bike')}
  it { is_expected.to respond_to('release_bike')}

  describe ".release_bike" do
    it "can release a bike" do
      subject.dock_bike(Bike.new)
      expect(subject.release_bike).to be_instance_of Bike
    end

    it "release up to 20 bikes" do
      20.times { subject.dock_bike Bike.new }
      expect(subject.see_bikes.length).to eq DEFAULT_CAPACITY
    end

    it "raise error when no bikes" do
      expect { subject.release_bike }.to raise_error "No bikes available"
    end
  end

  describe ".dock_bike" do
    it 'docks a bikes' do
      new_bike = Bike.new
      subject.dock_bike(new_bike)
      expect(subject.see_bikes[0]).to eq new_bike
    end

    it "Raises an error when more than 20 bikes docked" do
      20.times {subject.dock_bike(Bike.new)}
      expect { subject.dock_bike(Bike.new)}.to raise_error "Station full!"
    end

    it "can set a bike as broken" do
      bike = Bike.new
      subject.dock_bike(bike, 'report')
      expect(bike.working?).to eq false
    end
  end

  it "can set a capacity" do
    ds = DockingStation.new(10)
    10.times { ds.dock_bike(Bike.new)}
    expect { ds.dock_bike(Bike.new)}.to raise_error "Station full!"
  end

  it "defaults to DEFAULT_CAPACITY" do
    ds = DockingStation.new
    20.times { ds.dock_bike(Bike.new)}
    expect { ds.dock_bike(Bike.new)}.to raise_error "Station full!"
  end
end
