class BinarySearch
  attr_reader :list, :middle
  def initialize(list)
    raise ArgumentError, "List:#{list} is not sorted." if list != list.sort
    @list = list
    @middle = @list.length / 2
    @root = list[@middle]
  end

  def search_for(value, top = @list.length, bottom = 0)
    middle = (bottom + top) / 2
    root = @list[middle]
    return middle if root == value
    raise RuntimeError if bottom == middle
    return search_for(value, middle, bottom) if root > value
    raise RuntimeError if top == middle
    return search_for(value, top, middle)
  end
end
