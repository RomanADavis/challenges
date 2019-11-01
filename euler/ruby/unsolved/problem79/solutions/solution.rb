require "set"

keylogs = File.readlines("../input/keylogs.txt")

keys = Hash.new()

keylogs.each do |log|
  keys[log[0]] = {before: Set.new, after: Set.new} unless keys[log[0]]
  keys[log[0]][:after] << log[1] << log[2]
  keys[log[1]] = {before: Set.new, after: Set.new} unless keys[log[1]]
  keys[log[1]][:after] << log[2]
  keys[log[1]][:before] << log[0]
  keys[log[2]] = {before: Set.new, after: Set.new} unless keys[log[2]]
  keys[log[2]][:before] << log[0] << log[2]
end

p keys
