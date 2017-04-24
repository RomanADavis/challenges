class Game < Struct.new(:rolls, :frames)
  def initialize
    self.rolls = []
    self.frames = []
  end

  def roll(n)
    self.rolls << n
  end

  def organize_frames
    frame = []
    self.rolls.each do |roll|
      if roll == 10
        self.frames << [10]
        frame = []
      else
        frame << roll
      end
      if frame.length == 2
        self.frames << frame
        frame = []
      end
    end
  end

  def score
    organize_frames
    total = 0
    10.times do |index|
      frame, after = self.frames[index], self.frames[index + 1], etc = self.frames[index + 2]
      if frame == [10]
        total += 10 + after.inject(:+) + (after == [10] ? etc : 0)
      elsif frame.inject(:+) == 10
        total += 10 + after.inject(:+)
      else
        total += frame.inject(:+)
      end
    end
    total
  end
end
