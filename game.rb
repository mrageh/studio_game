require_relative 'player'
require_relative 'die'
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
    number_rolled = Die.new.roll
    @players.each do |player|
      case
      when number_rolled < 3
        player.blam
      when number_rolled < 5
        puts "#{player.name}'s was skipped"
      else
        player.w00t
      end
    end
  end
end
