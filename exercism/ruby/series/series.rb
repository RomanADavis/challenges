class Series < Struct.new(:string)
  def initialize(string)
    self.string = string
  end

  def slices(length)
    raise(ArgumentError) if self.string.length < length
    self.string.chars.each_cons(length).to_a.map {|sequence| sequence.join}
  end
end
