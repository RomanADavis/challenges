class Repeatable
  attr_accessor :string, :values
  def initialize(string)
    self.string = string
    self.values = parse
  end

  def parse
    values = 10.times.map do |i|
      self.string.gsub('r', i.to_s).to_i
    end

    values.reject {|value| value.to_s.length != values[-1].to_s.length}
  end
end

class NonRepeatable
  attr_accessor :string, :values
  def initialize(string)
    self.string = string
    self.values = parse
  end

  def parse
    count = 10**self.string.count('n')
    bottom = 10**(self.string.count('n') - 1)

    (bottom...count).map do |n|
      n = n.to_s
      string = self.string
      n.length.times do |index|
        string = string.sub('n', n[index])
      end
      Replaceable.new(string).values
    end
  end
end
