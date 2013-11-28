require_relative "player"

class BerserkPlayer < Player
  def initialize(name, health)
    super(name, health)
    @woot_count = 0
  end

  def w00t
    super
    @woot_count += 1
    puts "#{name} is berserk!" if berserk?
  end

  def blam
    if berserk?
      w00t
    else
      super
    end
  end

  def berserk?
    @woot_count > 5
  end
end

if __FILE__ == $0
  berserker = BerserkPlayer.new("hulk", 50)
  6.times { berserker.w00t }
  2.times { berserker.blam }
  puts berserker.health
end
