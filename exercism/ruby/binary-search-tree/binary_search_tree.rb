class Bst < Struct.new(:data, :left, :right)
  VERSION = 1
  def initialize(value)
    self.data = value
  end

  def insert(value)
    if value > data
      return self.right = Bst.new(value) if right.nil?
      right.insert(value)
    else
      return self.left = Bst.new(value) if left.nil?
      left.insert(value)
    end
  end

  def values
    values = []
    values << data unless data.nil?
    left.values.each {|value| values << value} unless left.nil?
    right.values.each {|value| values << value} unless right.nil?
    values.sort
  end

  def each
    return values.to_enum(:each) unless block_given?
    values.each {|v| yield(v)}
  end
end

tree = Bst.new(4)
tree.insert(2)
p tree.values
