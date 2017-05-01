class Deque
  attr_accessor :head, :tail
  # push and pop to the tail
  # previous is in front of the tail
  def push(value)
    return seed(value) unless self.tail
    node = Node.new(value)
    node.previous = self.tail
    self.tail.next = node
    self.tail = node
  end

  def pop
    result = self.tail
    self.tail = self.tail.previous
    self.tail ? self.tail.next = nil : self.head = nil # Empty list
    result.data
  end

  # shift and unshift from the head
  # next is behind the head
  def unshift(value)
    return seed(value) unless self.head
    node = Node.new(value)
    node.next = self.head
    self.head.previous = node
    self.head = node
  end

  def shift
    result = self.head
    self.head = self.head.next
    self.head ? self.head.previous = nil : self.tail = nil # Empty list
    result.data
  end

  private
  def seed(value)
    seed = Node.new(value)
    self.head = seed
    self.tail = seed
  end
end

class Node
  attr_accessor :data, :next, :previous
  def initialize(value)
    self.data = value
  end
end
