class Primes
  def self.under(n)
    candidates = (3..n).step(2).to_a
    primes     = [2]
    cap        = n**0.5

    until candidates.empty? || primes.last > cap
      primes << candidates.shift
      candidates.reject! {|candidate| candidate % primes.last == 0}
    end

    primes + candidates
  end
end


primes = Primes.under(10_000).reject! {|prime| prime < 1000}

answers = (1_000...(10_000 - 6660)).select do |n|
  triple = [n, n + 3330, n + 6660]
  next false unless triple.all? {|trip| primes.include? trip}
  permutations = n.to_s.chars.permutation.map {|mutation| mutation.join.to_i}
  triple.all? {|triple| permutations.include? triple}
end

answer = answers.last

p "#{answer}#{answer + 3330}#{answer + 6660}".to_i
