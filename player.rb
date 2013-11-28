require_relative "treasure_trove"
require_relative "playable"

class Player
  include Playable
  attr_reader :name
  attr_accessor :health

  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
    @found_treasures = Hash.new(0)
  end

  def self.from_csv(string)
    name, health = string.split(',')
    player = Player.new(name, Integer(health))
  end

  def each_found_treasure
    @found_treasures.each do |name, points|
      treasure = Treasure.new(name, points)
      yield treasure
    end
  end

  def found_treasure(treasure)
    @found_treasures[treasure.name] += treasure.points
    puts "#{name} found a #{treasure.name} worth #{treasure.points} points."
    puts "#{name} treasures: #{@found_treasures}"
  end

  def points
    @found_treasures.values.reduce(0) do |sum, treasure|
      sum += treasure
    end
  end

  def time
    Time.new.strftime("as of %I:%M:%S")
  end

  def score
    health + points
  end

  def to_s
   "I'm Moe with a health = #{health}, points = #{points} and score = #{score}."
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
