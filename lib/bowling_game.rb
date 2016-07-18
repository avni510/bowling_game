class BowlingGame

  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def score 
    sum = 0
    frame_pointer = 0
    (0...10).each do |i|
      if spare?(frame_pointer)
        sum += 10 + @rolls[frame_pointer + 2]
        frame_pointer += 2
      else
        sum += @rolls[frame_pointer] + @rolls[frame_pointer + 1]
        frame_pointer += 2
      end
    end
    sum
  end

  private 

  def spare?(frame_pointer)
    @rolls[frame_pointer] + @rolls[frame_pointer + 1] == 10
  end

end
