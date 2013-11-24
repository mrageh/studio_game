class Player
  attr_reader :health
  attr_accessor :name

  def initialize(name, health=100)
    @name = name
    @health = health
  end

  def time
    Time.new.strftime("as of %I:%M:%S")
  end

  def score
    health + name.length
  end

  def to_s
   "I'm #{@name.capitalize} with a health of #{health} and a score of #{score} as of #{time}."
  end

  def blam
    puts "#{name.capitalize} got blammed!"
    @health -= 10
  end

  def w00t
    puts "#{name.capitalize} got w00ted!"
    @health += 15
  end
end

player1 = Player.new("moe")
puts player1

player2 = Player.new("larry", 60)
puts player2
puts player2.inspect

player3 = Player.new("curly", 125)
puts player3
player3.blam
puts player3
player3.w00t
puts player3

player2 = Player.new("larry", 60)
puts player2.name
player2.name = "Lawrence"
puts player2.name
puts player2.health
puts player2.score
puts player2
