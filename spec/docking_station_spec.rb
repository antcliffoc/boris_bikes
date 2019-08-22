require './lib/docking_station'

describe DockingStation do


    it "creates a new docking station object" do
      expect(DockingStation.new).to be_instance_of DockingStation
    end


    it "release_bike" do
      expect(DockingStation.new).to respond_to(:release_bike)
    end


  it 'gets a bike' do
    bike = Bike.new
    expect(bike.working?).to be true
  end

  it { is_expected.to respond_to("dock_bike")}

  it 'gets bikes' do
    new_bike = Bike.new
    station = DockingStation.new
    station.dock_bike(new_bike)
    expect(station.see_bikes[0]).to eq(new_bike)
  end

  it "Raise error when no bikes" do
    station = DockingStation.new
     expect { station.release_bike }.to raise_error "No bikes available"
  end

  it "Raises an error when more than one bike docked" do
    station = DockingStation.new
    bike = Bike.new
    another_bike = Bike.new
    station.dock_bike(bike)
    expect { station.dock_bike(another_bike)}.to raise_error "Station full!"
  end

end
