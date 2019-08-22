
require_relative "bike"

DEFAULT_CAPACITY = 20

class DockingStation
  attr_reader :bike_array
  def initialize
    @bike_array = []

  end

  def release_bike
    raise "No bikes available" if empty?
    @bike_array[0]
  end

  def dock_bike(new_bike)
    raise "Station full!" if full?
    @bike_array.push(new_bike)
  end

  def see_bikes
    @bike_array
  end

  private
  def full?
    @bike_array.length == DEFAULT_CAPACITY
  end

  def empty?
    @bike_array.empty?
  end
end
