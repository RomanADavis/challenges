# Find all points (nodes) on the maze that are "intersections": Have 3 or more
# valid directions to move from.

map = File.open("challenge299.txt").readlines.map(&:chars)

nodes = 0

map.each_with_index do |row, y|
  row.each_with_index do |coord, x|
    if coord == "."
      adjacent_cells = row[x + 1], row[x - 1], map[y + 1][x], map[y - 1][x]
      nodes += 1 if adjacent_cells.count {|cell| cell == coor} > 2
    end
  end
end

p nodes
