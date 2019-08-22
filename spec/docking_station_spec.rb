require './lib/docking_station'

describe DockingStation do

  it "creates a new docking station object" do
    expect(DockingStation.new).to be_instance_of DockingStation
  end

  it "release_bike" do
    bike = Bike.new
    subject.dock_bike(bike)
    expect(subject.release_bike).to be_instance_of Bike
  end

  it "released up to 20 bikes" do
    20.times { subject.dock_bike Bike.new }
    expect(subject.see_bikes.length).to eq(DEFAULT_CAPACITY)
  end

  it 'gets a bike' do
    bike = Bike.new
    expect(bike.working?).to be true
  end

  it { is_expected.to respond_to("dock_bike")}

  it 'gets bikes' do
    new_bike = Bike.new
    subject.dock_bike(new_bike)
    expect(subject.see_bikes[0]).to eq(new_bike)
  end

  it "Raise error when no bikes" do
    expect { subject.release_bike }.to raise_error "No bikes available"
  end

  it "Raises an error when more than 20 bikes docked" do
    20.times {subject.dock_bike(Bike.new)}
    expect { subject.dock_bike(Bike.new)}.to raise_error "Station full!"
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

  it { should respond_to(:report)}

  it "can set a bike as broken" do
    bike = bike.new
    subject.dock_bike(bike, report)
    expect(bike.working?).to eq(false)
  end

end
