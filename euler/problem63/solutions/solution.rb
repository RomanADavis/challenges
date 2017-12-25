total, n = 0, 1
until (9**n).to_s.length != n # 10**n will always be too large
  total += (1..9).count {|i| (i**n).to_s.length == n}
  n += 1
end

 p total
