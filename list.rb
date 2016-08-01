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
    @chainring=table[0]
    @cog=table[1]
    @rim=table[2]
    @tire=table[3]
    gear
    wheel
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

class List
  def initialize(list)
    @list=list
  end

  def create_bike_list
    @bike_list=[]
    (0...@list.size).each do |i|
      @bike_list.push(bike=Bike.new(@list[i]))
    end
  end
   def list_informaction
    (0...@bike_list.size).each do |i|
      puts "Bike nr #{i+1}:"
       @bike_list[i].informacions
     end
   end
end
list=List.new([[13,53,65,86],[6,3,45,13],[32,5,24,6]])
list.create_bike_list
list.list_informaction
