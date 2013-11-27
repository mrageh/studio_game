require_relative 'player'
require_relative 'game_turn'
require_relative 'treasure_trove'

class Game
  attr_reader :title
  def initialize(title)
    @title = title.capitalize
    @players = []
  end

  def high_score_entry(player)
    formatted_name = player.name.ljust(20, '.')
    "#{formatted_name} #{player.score}"
  end
  def save_high_scores(to_file="high_scores.txt")
    File.open(to_file, "w") do |file|
      file.puts "#{title} High Scores:"
      @players.sort.each do |player|
        file.puts high_score_entry(player)
      end
    end
  end

  def load_players(from_file)
    File.readlines(from_file).each do |line|
      add_player(Player.from_csv(line))
    end
  end

  def add_player(player)
    @players << player
  end

  def play(rounds)
    puts "There are #{@players.size} players in #{title}:"

    treasures = TreasureTrove::TREASURES
    puts "\nThere are #{treasures.size} treasures to be found:"
    treasures.each do |treasure|
      puts "A #{treasure.name} is worth #{treasure.points} points"
    end

    1.upto(rounds) do |round|
      if block_given?
       break if yield
      else
        puts "\nRound: #{round}"
        @players.each do |player|
          GameTurn.take_turn(player)
        end
      end
    end
  end

  def print_name_and_health(player)
    puts "#{player.name} (#{player.health})"
  end

  def total_points
    @players.reduce(0) {|sum, player| sum + player.points}
  end

  def print_stats
    strong, weak = @players.partition do |player|
      player.strong?
    end

    puts "\n#{title} Statistics:"

    @players.each do |player|
      puts "\n#{player.name}'s point totals:"
      player.each_found_treasure do |treasure|
        puts "#{treasure.points} total #{treasure.name} points"
      end
      puts "#{player.points} grand total points"
    end


    puts "\n#{strong.count} strong players:"
    strong.each do |player|
     print_name_and_health(player)
    end

    puts "\n#{weak.count} wimpy players"
    weak.each do |player|
     print_name_and_health(player)
    end

    puts "\n#{title} High Scores:"
    @players.sort.each do |player|
      puts high_score_entry(player)
    end
  end

end
