require_relative 'game'

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
    @game.play
    @player.health.should == @initial_health + 15
  end

  it "the health stays the same if a medium number is rolled" do
    Die.any_instance.stub(:roll).and_return(3)
    @game.play
    @player.health.should == @initial_health
  end

  it "the health decreases if a low number is rolled" do
    Die.any_instance.stub(:roll).and_return(1)
    @game.play
    @player.health.should == @initial_health - 10
  end
end
