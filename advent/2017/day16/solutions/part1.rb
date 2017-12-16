class DanceLine
  attr_accessor :programs, :moves, :operations

  spin = ->(x) {self[0..-1] = self[-x.to_i..-1] + self[0..(-x.to_i - 1)]}
  exchange = ->(a, b) {self[a.to_i], self[b.to_i] = self[b.to_i], self[a.to_i]}
  partner = ->(a, b) {self[find_index(a)], self[find_index(b)] = b, a}

  @@operations = {'s' => spin,'x' => exchange,'p' => partner}

  def initialize(programs, dance_moves)
    self.programs = programs
    self.moves = dance_moves.split(',')
  end

  def execute(move)
    self.programs.instance_exec(*move[1..-1].split('/'), &@@operations[move[0]])
  end

  def run
    self.moves.each {|move| execute(move)}

    self.programs.join
  end
end

p DanceLine.new(('a'..'e').to_a, "s1,x3/4,pe/b").run
p DanceLine.new(('a'..'p').to_a, File.read("../input/dance_moves.txt").chomp).run
