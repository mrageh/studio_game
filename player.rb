class Player
  attr_reader :health
  attr_accessor :name

  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
  end

  def time
    Time.new.strftime("as of %I:%M:%S")
  end

  def strong?
    health > 100 ? true : false
  end

  def score
    health + name.length
  end

  def to_s
   "I'm #{name} with a health of #{health} and a score of #{score}"
  end

  def blam
    puts "#{name} got blammed!"
    @health -= 10
  end

  def w00t
    puts "#{name} got w00ted!"
    @health += 15
  end

  def <=> (other_player)
    other_player.score <=> score
  end

end

#basic example usage of class
if __FILE__ == $0
  player = Player.new("larry", 60)
  puts player
  player.blam
  player.w00t
  player.w00t
  puts player.time
  puts player
end
