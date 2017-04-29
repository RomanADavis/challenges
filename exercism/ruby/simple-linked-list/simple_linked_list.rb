class SimpleLinkedList
  attr_accessor :top
  def initialize(array = nil)
    if array
      array = array.to_a
      until array.empty?
        push(Element.new(array[0]))
        array.shift
      end
    end
  end

  def empty?
    !self.top
  end

  def push(element)
    element.next = self.top
    self.top = element
    self
  end

  def pop
    val = self.top
    self.top = empty? ? nil : self.top.next
    val
  end

  def to_a
    array = []
    element = self.top
    while element
      array << element.datum
      element = element.next
    end
    array
  end

  def push_bottom(element)
    if empty?
      push(element)
    else
      temp = pop
      push_bottom(element)
      push(temp)
    end
  end

# Stole the algo from here: http://www.geeksforgeeks.org/reverse-a-stack-using-recursion/
# Would very much like to understand it better.
  def reverse!
    unless empty?
      temp = pop
      reverse!
      push_bottom(temp)
    end
    self
  end
end

class Element
  attr_accessor :datum, :next
  def initialize(datum)
    self.datum = datum
  end
end

module BookKeeping
  VERSION = 1
end
