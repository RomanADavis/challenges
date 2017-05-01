class CircularBuffer
  attr_accessor :size, :memory
  def initialize(size)
    self.size = size
    self.memory = []
  end

  def read
    raise BufferEmptyException if self.memory.empty?
  end
end

class BufferEmptyException < StandardError
end
