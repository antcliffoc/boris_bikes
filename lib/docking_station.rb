
require_relative "bike"

DEFAULT_CAPACITY = 20

class DockingStation
  attr_reader :bike_array
  def initialize(capacity=DEFAULT_CAPACITY)
    @bike_array = []
    @capacity = capacity


  end
  def report(bike)
    bike.break
  end
  def release_bike
    raise "No bikes available" if empty?
    @bike_array[0]
  end

  def dock_bike(new_bike, report=false)
    raise "Station full!" if full?
    @bike_array.push(new_bike)
    report(new_bike) if report
  end

  def see_bikes
    @bike_array
  end

  private
  def full?
    @bike_array.length == @capacity
  end

  def empty?
    @bike_array.empty?
  end
end
