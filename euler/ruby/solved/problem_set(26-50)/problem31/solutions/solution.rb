def ways_to_make_change(amount, coins) # Greedy algo
  coins = coins.sort.reverse
  return 0 if amount < 0 # Just in case I made a mistake
  return 1 if coins.length == 1 ## Assumes that last value is 1
  coin = coins.shift
  ways = 0
  (0..(amount / coin)).each do |n|
    sub_amount = n * coin
    ways += ways_to_make_change(amount - sub_amount, coins)
  end
  ways
end

p ways_to_make_change(100, [1, 5, 10, 25, 50, 100])
p ways_to_make_change(200, [1, 2, 5, 10, 20, 50, 100, 200])
