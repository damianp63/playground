class Gear
  def initialize(chainring, cog)
    @chainring=chainring
    @cog=cog
  end

  def ratio
    @chainring/@cog.to_f
  end
end

class Wheel
  def initialize(rim, tire)
    @rim=rim
    @tire=tire
  end

  def duplication
    @tire*2
  end

  def diameter
    @rim+duplication
  end
end

class Bike
  def initialize(chainring, cog, rim, tire)
    @chainring=chainring
    @cog=cog
    @rim=rim
    @tire=tire
  end

  def gear
    @gear=Gear.new(@chainring,@cog)
  end

  def wheel
    @wheel=Wheel.new(@rim,@tire)
  end

  def informacions
    puts "Gear value is #{@gear.ratio}"
    puts "Wheel value is #{@wheel.diameter}"
  end
end

bike=Bike.new(13,5,10,74)
bike.gear
bike.wheel
bike.informacions
