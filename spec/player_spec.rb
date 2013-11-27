require './player'

describe do
  before do
    $stdout = StringIO.new
    @player = Player.new("moe", 120)
  end

  it "has a capitalized name" do
    @player.name.should == "Moe"
  end

  it "has a string representation" do
    @player.to_s.should == "I\'m Moe with a health of 120 and a score of 123"
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

  it "has a score" do
    @player.score.should == 123
  end


  context "is created with a default health" do
    before do
      @player = Player.new("moe")
    end

    it "has default health if none is specified" do
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

  context "in a collection of players" do
  before do
    @player1 = Player.new("moe", 100)
    @player2 = Player.new("larry", 200)
    @player3 = Player.new("curly", 300)

    @players = [@player1, @player2, @player3]
  end

  it "is sorted by decreasing score" do
    @players.sort.should == [@player3, @player2, @player1]
  end
end
end
