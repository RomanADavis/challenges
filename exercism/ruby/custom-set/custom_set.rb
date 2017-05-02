class CustomSet
  attr_reader :set
  def initialize(set)
    @set = set.sort.uniq
  end

  def empty?
    @set.length == 0
  end

  def member?(value)
    @set.any? {|member| member == value}
  end

  def subset?(other)
    @set.all? {|member| other.member? member}
  end

  def ==(other)
    subset?(other) && other.subset?(self)
  end

  def disjoint?(other)
    intersection(other).empty?
  end

  def intersection(other)
    self.class.new(@set.select {|member| other.member? member})
  end

  def add(element)
    self.class.new(@set << element)
  end

  def difference(other)
    self.class.new(@set.reject {|member| other.member? member})
  end

  def union(other)
    self.class.new(@set + other.set)
  end
end

module BookKeeping
  VERSION = 1
end
