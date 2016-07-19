require "bowling_game"

describe BowlingGame do

  let(:game) { BowlingGame.new }

  def roll_many(num, pins_rolled)
    num.times {game.roll(pins_rolled)}
  end

  def roll_spare
    2.times { game.roll(5) }
  end

  def roll_strike
    game.roll(10)
  end

  it "can score a gutter game" do
    roll_many(20, 0)
    expect(game.score).to eq(0)
  end


  it "can score a game of all ones" do 
    roll_many(20, 1)

    expect(game.score).to eq(20)
  end

  it "can score a game with a spare" do 
    roll_spare
    game.roll(3)
    roll_many(17, 0)
    expect(game.score).to eq(16)
  end
  
  it "can score a game with a strike" do 
    roll_strike
    game.roll(3)
    game.roll(4)
    roll_many(16, 0)
    expect(game.score).to eq(24)
  end

end