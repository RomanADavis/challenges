class DanceLine
  attr_accessor :programs, :moves
  def initialize(programs, dance_moves)
    self.programs = programs
    self.moves = dance_moves.split(',')
  end

  def spin(arg)
    x = arg.to_i
    self.programs = self.programs[-x..-1] + self.programs[0..(-x - 1)]
  end

  def exchange(args) # switch programs at position a and b
    a, b = args.chomp.split('/').map(&:to_i)
    hold = self.programs[a]
    self.programs[a] = self.programs[b]
    self.programs[b] = hold
  end

  def partner(args) # switch programs named a and b
    a, b = args.chomp.split('/')
    hold_index = self.programs.find_index(b)
    self.programs[self.programs.find_index(a)] = b
    self.programs[hold_index] = a
  end

  def execute(move)
    #p [move, self.programs]
    case move[0]
    when 's' then spin(move[1..-1])
    when 'x' then exchange(move[1..-1])
    when 'p' then partner(move[1..-1])
    end
  end

  def run
    self.moves.each {|move| execute(move)}

    self.programs.join
  end
end

p DanceLine.new(('a'..'e').to_a, "s1,x3/4,pe/b").run
p DanceLine.new(('a'..'p').to_a, File.read("../input/dance_moves.txt").chomp).run
