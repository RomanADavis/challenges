p (1..1000).inject {|total, n| total + n**n}.to_s[-10..-1]
