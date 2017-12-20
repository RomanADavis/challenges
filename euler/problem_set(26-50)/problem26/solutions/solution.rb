class One # Pretty slow, unfortunately.
  def self./(n)
    val, remainder = 0, 1
    cycle = [[val, remainder]]
    until cycle.uniq != cycle || remainder == 0
      val, remainder = (remainder * 10).divmod(n)
      cycle << [val, remainder]
    end

    cycle = cycle[(cycle.index {cycle.last})..-2] if cycle.uniq != cycle
    cycle.map(&:first)[1..-1]
  end
end

candidates = (1..999).map {|n| (One/n).length}
p candidates.find_index(candidates.max) + 1
