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

  def self.decode(message)
    index = 0
    output = ""
    while index < message.length
      number = ""
      while message[index].to_i.to_s == message[index]
        number += message[index]
        index += 1
      end
      output += message[index] * (number.empty? ? 1 : number.to_i)
      index += 1
    end
    output
  end
end

module BookKeeping
  VERSION = 2
end
