class Zoo
  def initialize(list)
    @list=list
  end
  def say_hello
    @list.each do |i|
      i.say_hello(self)
    end
  end
end

class Pies
  def say_hello(voice)
    puts "Bark!"
  end
end

class Kot
  def say_hello(voice)
    puts "Miau!"
  end
end

class Czlowiek
  def say_hello(voice)
    puts "hello"
  end
end

list=Zoo.new([p1=Pies.new,p2=Pies.new,c1=Czlowiek.new,k1=Kot.new,c2=Czlowiek.new])
list.say_hello
