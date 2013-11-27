require_relative 'game'

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
knuckleheads.play(2)
knuckleheads.print_stats

chipmunks = Game.new("chipmunks")
chipmunks.add_player(player1)
chipmunks.add_player(player4)
chipmunks.add_player(player5)
chipmunks.add_player(player6)
chipmunks.play(3)
chipmunks.print_stats
