require_relative 'game'
require_relative 'clumsy_player'
require_relative 'berserk_player'

knuckleheads = Game.new("knuckleheads")
# knuckleheads.add_player(player1)
# knuckleheads.add_player(player2)
# knuckleheads.add_player(player3)
knuckleheads.load_players(ARGV.shift || "players.csv")
clumsy = ClumsyPlayer.new("klutz", 105)
knuckleheads.add_player(clumsy)
hulk = BerserkPlayer.new("hulk", 50)
knuckleheads.add_player(hulk)
loop do
  puts "How many game rounds? ('quit' to exit)"
  answer = gets.chomp.downcase
  case answer
  when 'quit', 'exit'
    knuckleheads.print_stats
    break
  when /^\d+$/
    knuckleheads.play(answer.to_i)
  else
    puts "Please enter a number or quit"
  end
end
knuckleheads.save_high_scores
