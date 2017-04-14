class RunLengthEncoding
  def self.encode(string)
    last = encoding = ''
    count = 0
    string.chars.each do |char|
      count += 1 if last == char
      unless last == char
        encoding += "#{count > 1 ? count : ""}#{last}"
        last, count = char, 1
      end
    end
    encoding + "#{count > 1 ? count : ""}#{last}"
  end
end
