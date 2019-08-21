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

    it "with at least one argument" do
      expect(DockingStation.new).to respond_to(:release_bike).with(1).arguments
    end
    
  end

end
