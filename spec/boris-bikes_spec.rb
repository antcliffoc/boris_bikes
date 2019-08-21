require './lib/boris-bikes'

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

end
