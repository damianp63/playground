class Gear
  def initialize(chainring: 11, cog: 11)
    @chainring=chainring
    @cog=cog
  end

  def ratio
    @chainring/@cog.to_f
  end
end

class Wheel
  def initialize(rim: 11, tire: 11)
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
  def initialize(table:)
     @chainring=table["chainring"]
     @cog=table["cog"]
     @rim=table["rim"]
     @tire=table["tire"]
    gear
    wheel
  end

  def gear
    @gear||=Gear.new(chainring: @chainring, cog: @cog)
  end

  def wheel
    @wheel||=Wheel.new(rim: @rim,tire: @tire)
  end

  def informations
    puts "Gear value is #{@gear.ratio}"
    puts "Wheel value is #{@wheel.diameter}"
  end
end

class List
  def initialize(raw_bikes:)
    @raw_bikes=raw_bikes
  end

  def create_bike_list
    @bikes=[]
    @raw_bikes.each do |item_on_the_list|
      @bikes << Bike.new(table: item_on_the_list)
    end
    @bikes=@bikes.map
  end
   def list_information
     @bikes.each do |item_on_the_list|
       item_on_the_list.informations
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
list=List.new(raw_bikes:[b1,b2,b3])
list.create_bike_list
list.list_information
