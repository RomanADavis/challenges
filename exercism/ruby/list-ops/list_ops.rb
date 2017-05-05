class ListOps
  def self.arrays(array)
    array.length
  end

  def self.eacher(array)
    arrays(array).times do |iterator|
      item = array[iterator]
      yield(item)
    end
  end

  def self.reverser(array)
    result = []
    eacher(array) {|element| result.unshift(element)}
    result
  end

  def self.concatter(first_half, second_half)
    result = first_half.dup
    eacher(second_half) {|element| result << element}
    result
  end

  def self.mapper(array)
    result = []
    eacher(array) {|item| result << yield(item)}
    result
  end

  def self.filterer(array)
    result = []
    eacher(array) {|item| result << item if yield(item)}
    result
  end

  def self.injector(array, start = 0)
    total = start
    eacher(array) {|element| total = yield(total, element)}
    total
  end

  def self.sum_reducer(array)
    injector(array) {|total, element| total + element}
  end

  def self.factorial_reducer(array)
    injector(array, 1) {|total, element| total * element}
  end
end

module BookKeeping
  VERSION = 2
end
