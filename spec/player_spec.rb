require './player'
require './treasure_trove'

describe do
  before do
    $stdout = StringIO.new
    @player = Player.new("moe", 120)
  end

  it "has a capitalized name" do
    @player.name.should == "Moe"
  end

  it "has a string representation" do
    @player.found_treasure(Treasure.new(:hammer, 50))
    @player.found_treasure(Treasure.new(:hammer, 50))

    @player.to_s.should == "I'm Moe with a health = 120, points = 100 and score = 220."
  end

  it "has health" do
    @player.health.should == 120
  end

  it "can be attacked with blam" do
    @player.blam.should == 110
  end

  it "can recover with w00t" do
    @player.w00t.should == 135
  end

  it "computes a score as the sum of its health and points" do
    @player.found_treasure(Treasure.new(:hammer, 50))
    @player.found_treasure(Treasure.new(:hammer, 50))

    @player.score.should == 220
  end

  it "computes points as the sum of all treasure points" do
    @player.points.should == 0

    @player.found_treasure(Treasure.new(:hammer, 50))

    @player.points.should == 50

    @player.found_treasure(Treasure.new(:crowbar, 400))

    @player.points.should == 450

    @player.found_treasure(Treasure.new(:hammer, 50))

    @player.points.should == 500
  end

  context "is created with" do
    before do
      @player = Player.new("moe")
    end

    it "default health if none is specified" do
      @player.health.should == 100
    end
  end

  context "is created as a strong player" do
    before do
      @player = Player.new("beast", 150)
    end

    it "is a strong player" do
      @player.should be_strong
    end
  end

  context "is created as a weak player" do
    before do
      @player = Player.new("wimp", 100)
    end

    it "is a weak player" do
      @player.should_not be_strong
    end
  end

  context "a collection of players" do
    before do
      @player1 = Player.new("moe", 100)
      @player2 = Player.new("larry", 200)
      @player3 = Player.new("curly", 300)

      @players = [@player1, @player2, @player3]
    end

    it "are sorted by decreasing score" do
      @players.sort.should == [@player3, @player2, @player1]
    end
  end

  it "yields each found treasure and its total points" do
    @player.found_treasure(Treasure.new(:skillet, 100))
    @player.found_treasure(Treasure.new(:skillet, 100))
    @player.found_treasure(Treasure.new(:hammer, 50))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))

    yielded = []
    @player.each_found_treasure do |treasure|
      yielded << treasure
    end
    yielded.should == [
      Treasure.new(:skillet, 200),
      Treasure.new(:hammer, 50),
      Treasure.new(:bottle, 25)
    ]
  end
end
