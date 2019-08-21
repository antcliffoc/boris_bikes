
require_relative "bike"


class DockingStation

  attr_reader :bike_array

  def initialize
    @bike_array = []
  end

  def release_bike
    return @bike_array[0]
  end

  def dock_bike(new_bike)
    @bike_array.push(new_bike)
  end

  def see_bikes
    @bike_array
  end
end
