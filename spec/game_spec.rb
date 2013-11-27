require './game'

describe Game do
  before do
    @game = Game.new('knucklehead')
    $stdout = StringIO.new
    @initial_health = 100
    @player = Player.new('moe', @initial_health)

    @game.add_player(@player)
  end

  it "the health increases if a high number is rolled" do
    Die.any_instance.stub(:roll).and_return(5)
    @game.play(2)
    @player.health.should == @initial_health + 30
  end

  it "the health stays the same if a medium number is rolled" do
    Die.any_instance.stub(:roll).and_return(3)
    @game.play(5)
    @player.health.should == @initial_health
  end

  it "the health decreases if a low number is rolled" do
    Die.any_instance.stub(:roll).and_return(1)
    @game.play(2)
    @player.health.should == @initial_health - 20
  end

  context "player stats" do
    before do
      @initial_health = 120
      @player = Player.new('moe', @initial_health)
      @player2 = Player.new('dan', 90)
    end

    it "should print as a strong player" do
      Die.any_instance.stub(:roll).and_return(3)
      @game.play(1)
      #how do I test local variables in method?
    end
  end
end
