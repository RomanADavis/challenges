class Game < Struct.new(:rolls, :frames)
  def initialize
    self.rolls = []
    self.frames = []
  end

  def roll(pins)
    raise Game::BowlingError if pins < 0 || pins > 10
    self.rolls << pins
  end

  def organize_frames
    frame = []
    self.rolls.each do |roll|
      if roll == 10 && frame.empty?
        self.frames << [10]
        frame = []
      else
        frame << roll
      end
      if frame.length == 2
        self.frames << frame
        raise(Game::BowlingError) if frame.inject(:+) > 10
        frame = []
      end
    end
    self.frames << frame unless frame.empty?
  end

  def score
    raise(Game::BowlingError) if self.rolls.empty?
    organize_frames
    raise(Game::BowlingError) unless self.frames.length > 9
    raise(Game::BowlingError) if self.frames.length > 10 && self.frames[9].inject(:+) != 10
    total = 0
    10.times do |index|
      frame, after = self.frames[index], self.frames[index + 1], etc = self.frames[index + 2]
      if frame == [10]
        raise(Game::BowlingError) unless after
        raise(Game::BowlingError) unless etc if after == [10]
        total += 10 + after.inject(:+) + (after == [10] ? etc.first : 0)
      elsif frame.inject(:+) == 10
        raise(Game::BowlingError) unless after
        total += 10 + after.first
      else
        total += frame.inject(:+)
      end
    end
    total
  end
  class BowlingError < StandardError
  end
end

def roll(game, rolls)
  rolls.each do |roll| game.roll(roll) end
end

class BookKeeping
  VERSION = 3
end
