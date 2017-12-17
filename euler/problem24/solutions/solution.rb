# Something tells me that they assumed the problem would be harder than this.
p (0..9).to_a.permutation.to_a[1_000_000 - 1].map(&:to_s).join.to_i
