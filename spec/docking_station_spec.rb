require './lib/docking_station'

describe DockingStation do

  describe "creating a DockStation" do
    it "creates a new docking station object" do
      expect(DockingStation.new).to be_instance_of DockingStation
    end
  end

  describe "instance implements" do
    it "release_bike" do
      expect(DockingStation.new).to respond_to(:release_bike)
    end
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

end
