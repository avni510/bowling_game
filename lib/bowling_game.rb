class BowlingGame

  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def score 
    score_total = 0
    frame_pointer = 0
    (0...10).each do |frame|
      if strike?(frame_pointer)
        score_total += 10 + strike_bonus(frame_pointer)
        frame_pointer += 1
      elsif spare?(frame_pointer)
        score_total += 10 + spare_bonus(frame_pointer)
        frame_pointer += 2
      else
        score_total += sum_of_balls_in_frame(frame_pointer)
        frame_pointer += 2
      end
    end
    score_total
  end 

  def spare?(frame_pointer)
    @rolls[frame_pointer] + @rolls[frame_pointer + 1] == 10
  end

  def strike?(frame_pointer)
    @rolls[frame_pointer] == 10
  end

  def spare_bonus(frame_pointer)
    @rolls[frame_pointer + 2]
  end

  def strike_bonus(frame_pointer)
     @rolls[frame_pointer + 1] + @rolls[frame_pointer + 2]
  end

  def sum_of_balls_in_frame(frame_pointer)
    @rolls[frame_pointer] + @rolls[frame_pointer + 1]
  end

end
