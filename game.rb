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
   "I'm #{@name.capitalize} with a health of #{health} and a score of #{score}"
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
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)
player4 = Player.new("shemp", 90)

players = [player1, player2, player3]
players.pop
players.push(player4)
puts "There are #{players.count} players in the game:"

players.each do |player|
  puts player
end

players.each do |player|
  puts player.health
end

players.each do |player|
  player.blam
  player.w00t
  player.w00t
  puts player
end
