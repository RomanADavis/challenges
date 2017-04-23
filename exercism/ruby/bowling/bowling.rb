class Game < Struct.new(:rolls, :frames)
  def initialize
    self.rolls = []
    self.frames = [[0] * 12]
  end

  def roll(pins)
    self.rolls << pins
    track_frames(pins)
  end

  def track_frames(pins)
    if self.frames.empty? || self.frames.length > 1 || self.frames.first == 10
      self.frames << [pins]
    else
      self.frames.last << pins
    end
  end

  def score
    scores = []
    10.times do |index|
      frame, after, etc = self.frames[index], self.frames[index + 1],
                          self.frames[index + 2]
      if frame.first == 10 # strike
        score = 10 + (after.first == 10 ? 10 + etc.first : after.inject(:+))
      elsif frame.inject(:+) == 10
        score = 10 + after.first
      else
        score = frame.inject(:+)
      end
      scores << score
    end
    score.inject(:+)
  end
end
