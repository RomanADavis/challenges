input = File.readlines("../input/grid.txt").map {|row| row.split.map(&:to_i)}

require "matrix"

class Grid
  attr_accessor :content
  def initialize(content)
    self.content = content
  end

  def greatest_adjacent(n)
    products =  horizontal_products(n).flatten
    products += vertical_products(n).flatten
    products += right_diagonal_products(n).flatten
    products += left_diagonal_products(n).flatten
    products.max
  end

  def horizontal_products(n)
    self.content.map do |row|
      row.each_cons(n).map {|adjacent| adjacent.inject(:*)}
    end
  end

  def vertical_products(n)
    self.content.transpose.map do |row|
      row.each_cons(n).map {|adjacent| adjacent.inject(:*)}
    end
  end

  def right_diagonal_products(n)
    self.content[0..(self.content.length - n)].map.with_index do |row, y|
      row[0..(self.content.length - n)].map.with_index do |cell, x|
        adjacent = n.times.inject([]) do |total, i|
          total << self.content[x + i][y + i]
        end

        adjacent.inject(:*)
      end
    end
  end

  def left_diagonal_products(n)
    self.content[n..self.content.length].map.with_index do |row, y|
      row[0..(self.content.length - n)].map.with_index do |cell, x|
        adjacent = n.times.inject([]) do |total, i|
          total << self.content[x + i][y - i]
        end

        adjacent.inject(:*)
      end
    end
  end
end

p Grid.new(input).greatest_adjacent(4)
