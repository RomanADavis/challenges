##  Multiples of 3 and 5
#  If we list all the natural numbers below 10 that are multiples of 3 or 5, we
#get 3, 5, 6 and 9. The sum of these multiples is 23.
#  Find the sum of all the multiples of 3 or 5 below 1000.

# Golfed version
 p (1..1000).select {|number| number % 3 == 0 || number % 5 == 0}.inject(:+)

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
   @@set = (1..Float::INFINITY)

   def self.set
     @@set
   end

   def self.under(number)
     @@set.take_while {|member| member < 1_000}
     self
   end

   def self.multiples_of(*numbers)
     numbers = numbers.map do |number|
       @@set.collect {|member| member * number}
     end
     @@set = numbers.inject(:|)
     self
   end

   def self.sum
     @@set.to_a.inject(:+)
   end
 end

 class Array
   def sum
     self.inject(:+)
   end
 end

 class Integer
   def multiple_of?(other)
     self % other == 0
   end
 end

 puts NaturalNumbers.under(1000).multiples_of(5, 3).sum
 ## I think I can make a better SDL tnan this. Let me think about it.
