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
  def initialize(chainring: 12,cog: 11,rim: 11,tire: 11)
     @chainring=chainring
     @cog=cog
     @rim=rim
     @tire=tire
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
  def initialize(list_of_parameters:)
    @list_of_parameters=list_of_parameters
  end

  def create_bike_list
    @list_of_bikes=[]
    @list_of_parameters.each do |item_on_the_list|
      @list_of_bikes << Bike.new(chainring: item_on_the_list["chainring"],cog: item_on_the_list["cog"],
      rim: item_on_the_list["rim"],tire: item_on_the_list["tire"])
    end
  end
   def list_information
     @list_of_bikes.each do |item_on_the_list|
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
list=List.new(list_of_parameters:[b1,b2,b3])
list.create_bike_list
list.list_information
