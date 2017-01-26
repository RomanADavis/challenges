# --- Day 7: Some Assembly Required ---
#
# This year, Santa brought little Bobby Tables a set of wires and bitwise logic
# gates! Unfortunately, little Bobby is a little under the recommended age
# range, and he needs help assembling the circuit.
#
# Each wire has an identifier (some lowercase letters) and can carry a 16-bit
# signal (a number from 0 to 65535). A signal is provided to each wire by a
# gate, another wire, or some specific value. Each wire can only get a signal
# from one source, but can provide its signal to multiple destinations. A gate
# provides no signal until all of its inputs have a signal.
#
# The included instructions booklet describes how to connect the parts together:
# x AND y -> z means to connect wires x and y o an AND gate, and then connect
# its output to wire z.

class Emulator
  attr_accessor :output, :environment
  def initialize(input)
    #@input = input
    self.output = {}
    self.environment = {}
    input.each do |line|
      signal, wire = line.chomp.split(" -> ")
      self.environment[wire] = signal.split
    end
  end

  def calculate(wire)
    return wire.to_i if wire.match(/^\d+$/) # Is it a string of digits?
    #puts self.output
    unless self.output.has_key?(wire)
      puts "\'#{wire}\'"
      equation = self.environment[wire]
      #raise "There is no #{wire}" if equation.nil?

      if equation.length == 1
        value = calculate(equation.first)

      else
        op = equation[-2]
        a, b = equation.first, equation.last
        value = case op
                when "AND" then calculate(a) & calculate(b)
                when "OR" then calculate(a) | calculate(b)
                when "LSHIFT" then calculate(a) << calculate(b)
                when "RSHIFT" then calculate(a) >> calculate(b)
                when "NOT" then ~calculate(b)
                end
      end
      self.output[wire] = value
    end

    self.output[wire]
  end
end

e = Emulator.new(File.readlines("./input/instructions.txt"))
puts a = e.calculate('a')
