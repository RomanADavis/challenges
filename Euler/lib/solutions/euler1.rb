##  Multiples of 3 and 5
#  If we list all the natural numbers below 10 that are multiples of 3 or 5, we
#get 3, 5, 6 and 9. The sum of these multiples is 23.
#  Find the sum of all the multiples of 3 or 5 below 1000.

# Golfed version
 p 1000.times.inject {|total, n | n % 3 == 0 || n % 5 == 0 ? total + n : total}

 # Something a little stupid, but more readable
 total = 0
 iterator, limit = 1, 1000
while iterator < limit
  total += iterator if iterator % 3 == 0 || iterator % 5 == 0
  iterator += 1
end

 puts total

 ## SDLed?

 class NaturalNumbers
   def self.under(number)
     (1...number).to_a
   end
 end

 class Array
   def sum
     if block_given?
       self.inject {|total, number| yield(number) ? total + number : total }
     end
     self.inject(:+)
   end
 end

 class Integer
   def multiple_of?(other)
     self % other == 0
   end
 end

 p NaturalNumbers.under(1000).sum {|n| n.multiple_of?(3) || n.multiple_of?(5) }
