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

class Game
  attr_reader :title
  def initialize(title)
    @title = title.capitalize
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def play
    puts "There are #{@players.size} players in #{title}:"
    @players.each do |player|
      puts player
      player.blam
      player.w00t
      player.w00t
      puts player
    end
  end
end
player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)
player4 = Player.new("shemp", 90)
player4 = Player.new("alvin", 70)
player5 = Player.new("simon", 120)
player6 = Player.new("theodore", 140)

knuckleheads = Game.new("knuckleheads")
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.play

chipmunks = Game.new("chipmunks")
chipmunks.add_player(player1)
chipmunks.add_player(player4)
chipmunks.add_player(player5)
chipmunks.add_player(player6)
chipmunks.play
