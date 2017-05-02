class Triangle
  def initialize(height)
    @height = height
  end

  def rows
    rows = [[1]]
    (@height - 1).times do |row|
      middle = rows.last.each_cons(2).map {|pair| pair.inject(:+)}
      rows << [1] + (middle || []) + [1] # This is probably too clever, but I just found out I could do this! So cool!
    end
    rows
  end
end

p Triangle.new(3).rows
