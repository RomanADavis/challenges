pyramid = File.readlines("../input/triangle.txt").map {|layer| layer.split.map(&:to_i)}
sample = File.readlines("../input/sample.txt").map {|layer| layer.split.map(&:to_i)}

def total(pyramid)
  pyramid.reverse!
  pyramid.each.with_index do |layer, floor|
    next if floor == 0
    layer.map!.with_index do |number, index|
      number + pyramid[floor - 1][index..index + 1].max
    end
  end
  pyramid.last.first
end

p total(sample)
p total(pyramid)
