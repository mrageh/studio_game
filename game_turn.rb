require_relative 'die'
require_relative 'player'

module GameTurn
  def self.take_turn(player)
    number_rolled = Die.new.roll
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
