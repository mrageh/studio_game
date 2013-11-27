require_relative 'player'
require_relative 'game_turn'
require 'pry'

class Game
  attr_reader :title
  def initialize(title)
    @title = title.capitalize
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def play(rounds)
    puts "There are #{@players.size} players in #{title}:"
    1.upto(rounds) do |round|
      puts "\nRound: #{round}"
      @players.each do |player|
        GameTurn.take_turn(player)
      end
    end
  end


  def print_name_and_health(player)
    puts "#{player.name} (#{player.health})"
  end

  def print_stats
    strong, weak = @players.partition do |player|
      player.strong?
    end

    puts "\n#{title} Statistics:"

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
      puts "#{player.name.ljust(25, '.')} #{player.score}"
    end
  end

end
