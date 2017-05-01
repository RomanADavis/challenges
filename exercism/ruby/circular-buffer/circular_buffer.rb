class CircularBuffer
  class BufferEmptyException < StandardError
  end

  class BufferFullException < StandardError
  end

  attr_accessor :size, :behind, :ahead
  def initialize(size)
    self.size = size
    clear
  end

  def clear
    self.behind = []
    self.ahead = []
  end

  def full?
    self.ahead.length >= self.size
  end

  def write(value)
    raise BufferFullException if full?
    self.ahead << value
  end

  def write!(value)
    return write(value) unless full?
    self.ahead.shift
    write(value)
  end

  def read
    raise BufferEmptyException if self.ahead.empty?
    value = self.ahead.shift
    self.behind << value
    value
  end
end
