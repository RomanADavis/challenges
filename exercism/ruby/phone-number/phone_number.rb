class PhoneNumber < Struct.new(:number)
  def initialize(string)
    self.number = string.scan(/\d+/).join
    return self.number = '0' * 10 if string.match(/[a-zA-Z]/) || invalid?
    self.number = self.number[1..-1] if self.number.length == 11
  end

  def invalid?
    return true if self.number.length == 11 && self.number[0] != '1'
    return true if self.number.length != 10 && self.number.length != 11
    false
  end

  def area_code
    self.number[0...3]
  end

  def to_s
    "(#{self.number[0...3]}) #{self.number[3...6]}-#{self.number[6...10]}"
  end
end
