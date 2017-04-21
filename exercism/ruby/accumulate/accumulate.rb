class Array
  def accumulate(block = nil)
    block ? self.map(block) : self.map {|e| yield(e)}
  end
end

module BookKeeping
  VERSION = 1
end
