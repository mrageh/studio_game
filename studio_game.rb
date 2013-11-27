require_relative 'game'

# player1 = Player.new("moe")
# player2 = Player.new("larry", 60)
# player3 = Player.new("curly", 125)
# player4 = Player.new("shemp", 90)
# player4 = Player.new("alvin", 70)
# player5 = Player.new("simon", 120)
# player6 = Player.new("theodore", 140)

knuckleheads = Game.new("knuckleheads")
# knuckleheads.add_player(player1)
# knuckleheads.add_player(player2)
# knuckleheads.add_player(player3)
knuckleheads.load_players(ARGV.shift || "players.csv")
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
