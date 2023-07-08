require_relative '../game'

describe Game do
  context "With valid arguments" do
    it "should return if true or false for multiplayer" do
      game = Game.new(nil, "1994-09-08", true, "1998-07-07")
      expect(game.multiplayer).to eq(true)
    end
    
    it "should return date as valid argument for last_played_at" do
      game = Game.new(nil, "1994-09-08", true, "1998-07-07")
      expect(game.last_played_at).to eq("1998-07-07")
    end
  end

  context "can_be_archived?" do
    it "should return if game can be archived" do
      game = Game.new(nil, "1994-09-08", true, "1998-07-07")
      expect(game.can_be_archived?).to eq(true)
    end
  end
end