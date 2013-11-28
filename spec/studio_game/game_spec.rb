require 'studio_game/game'

module StudioGame
  describe Game do
    before do
      @game = Game.new('knucklehead')
      $stdout = StringIO.new
      @initial_health = 100
      @player = Player.new('moe', @initial_health)
      @player1 = Player.new("larry", @initial_health)
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

    it "assigns a treasure for point during a player's turn" do
      @game.add_player(@player)
      @game.play(1)
      @player.points.should_not be_zero
    end

    it "computes total points as the sum of all player points" do
      @game.add_player(@player1)
      @player.found_treasure(Treasure.new(:hammer, 50))
      @player.found_treasure(Treasure.new(:hammer, 50))
      @player1.found_treasure(Treasure.new(:crowbar, 400))
      @game.total_points.should == 500
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
end
