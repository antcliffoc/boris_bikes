class Bike
  def initialize
    @broken = false
  end

  def working?
    @broken ? false : true
  end

  def break
    @broken = true
  end

end
