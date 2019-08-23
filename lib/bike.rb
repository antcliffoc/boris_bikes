class Bike
  def initialize
    @broken = false
  end

  def working?
    @broken ? false : true
  end

  def report
    @broken = true
  end

end
