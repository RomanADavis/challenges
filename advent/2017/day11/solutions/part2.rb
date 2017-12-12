# --- Part Two ---
#
# How many steps away is the furthest he ever got from his starting position?

class Map
  attr_accessor :instructions, :directions, :route, :steps

  def initialize(instructions)
    self.steps = {"n" => 0, "ne" => 0, "nw" => 0}
    self.instructions = instructions.split(',')
  end

  def solve
    max = 0
    self.instructions.each do |instruction|
      parse(instruction)
      simplify
      p steps
      count
      max = count if count > max
    end

    max
  end

  def parse(instruction)
    return self.steps[instruction] += 1 if ["n", "ne", "nw"].include? instruction

    case instruction
    when "s" then self.steps["n"] -= 1
    when "sw" then self.steps["ne"] -= 1
    when "se" then self.steps["nw"] -= 1
    end
  end

  def simplify
    length = count

    if self.steps["n"] > 0
      if self.steps["ne"] < 0 # adds up to nw
        self.steps["n"] -= 1
        self.steps["ne"] += 1
        self.steps["nw"] += 1
      end
      if self.steps["nw"] < 0 # adds up to ne
        self.steps["n"] -= 1
        self.steps["nw"] += 1
        self.steps["ne"] += 1
      end
    end

    if self.steps["n"] < 0
      if self.steps["ne"] > 0 # adds up to se
        self.steps["n"] += 1
        self.steps["ne"] -= 1
        self.steps["nw"] -= 1
      end
      if self.steps["nw"] > 0 # adds up to sw
        self.steps["n"] += 1
        self.steps["nw"] -= 1
        self.steps["ne"] -= 1
      end
    end

    if self.steps["ne"] > 0 && self.steps["nw"] > 0 # adds up to n
      self.steps["ne"] -= 1
      self.steps["nw"] -= 1
      self.steps["n"] += 1
    end

    if self.steps["ne"] < 0 && self.steps["nw"] < 0 # adds up to s
      self.steps["ne"] += 1
      self.steps["nw"] += 1
      self.steps["n"] -= 1
    end

    count == length ? return : simplify
  end

  def count
    self.steps.values.map(&:abs).inject(:+)
  end
end

p Map.new("sw,nw").solve
p Map.new(File.read("../input/directions.txt").chomp).solve
