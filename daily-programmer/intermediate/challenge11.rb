# An “upside up” number is a number that reads the same when it is rotated 180°.
# For instance, 689 and 1961 are upside up numbers.
# Your task is to find the next upside up number greater than 1961, and to count
# the number of upside up numbers less than ten thousand.
# edit: since there is a confusion about 2 and 5, please consider them as
# "upside up" numbers for this problem. If you have already done without it, its
# ok.


def mirror number
  pairs = [[0, 0], [1, 1], [2, 5], [5, 2], [6, 9], [8, 8], [9, 9]]
  reverse = nil
  number.to_s.chars.map do |digit|
    pairs.each { |pair| reverse = pair.last if pair.first == digit.to_i }
    reverse ?
  end
end

def upside_up? number
  number == mirror_number
end

 #=- -=#=- -=#=- -=#=- TESTS -=#=- -=#=- -=#=- -=#=-
puts mirror
