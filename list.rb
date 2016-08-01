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
  def initialize(table)
    @chainring=table["chainring"] || 40
    @cog=table["cog"] || 23
    @rim=table["rim"] || 14
    @tire=table["tire"] || 67
    gear
    wheel
  end

  def gear
    @gear||=Gear.new(@chainring,@cog)
  end

  def wheel
    @wheel||=Wheel.new(@rim,@tire)
  end

  def informations
    puts "Gear value is #{@gear.ratio}"
    puts "Wheel value is #{@wheel.diameter}"
  end
end

class List
  def initialize(list)
    @list=list
  end

  def create_bike_list
    @bike_list=[]
    @list.each do |position|
      @bike_list << Bike.new(position)
    end
  end
   def list_information
     @bike_list.each do |position|
       position.informations
     end
   end
end
b1={"chainring" => 13,
  "cog" => 53,
  "rim" => 65,
  "tire" => 86}
b2={"chainring" => 6,
  "cog" => 3,
  "rim" => 45,
  "tire" => 13}
b3={"chainring" => 32,
    "cog" => 5,
    "rim" => 24,
    "tire" => 6}
list=List.new([b1,b2,b3])
list.create_bike_list
list.list_information
