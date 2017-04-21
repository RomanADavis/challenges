class ETL
  def self.transform(old)
    output = {}
    old.keys.each do |score|
      old[score].each {|letter| output[letter.downcase] = score}
    end
    output
  end
end
