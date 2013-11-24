class Player
  def initialize(name, health=100)
    @name = name
    @health = health
  end

  def time
    Time.new.strftime("as of %I:%M:%S")
  end

  def to_s
   "I'm #{@name.capitalize} with a health of #{@health} #{time}."
  end
end


player1 = Player.new("larry", 60)
puts player1

player2 = Player.new("curly", 125)
puts player2

player3 = Player.new("moe")
puts player3

player4 = Player.new("shemp", 90)
puts player4
