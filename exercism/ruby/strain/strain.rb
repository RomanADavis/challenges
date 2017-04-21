class Array
  def keep(block = nil)
    block ? self.select(block) : self.select {|i| yield(i)}
  end

  def discard(block = nil)
    block ? self.reject(block) : self.reject {|i| yield(i)}
  end
end
# I realize these solutions are sort of lame, but I did a much better version of
# this where I recreated the Ruby iterators for the Odin Project
