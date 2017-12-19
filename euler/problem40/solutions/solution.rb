class Champernowe
  def self.[](index)
    pointer = value = 0
    count = 1
    rail = [count]

    index.times do
      count, rail = count + 1, count.to_s.chars if rail.empty?
      value = rail.shift
    end
    
    value.to_i
  end
end

p 6.times.map {|n| Champernowe[10**n]}.inject(:*)
