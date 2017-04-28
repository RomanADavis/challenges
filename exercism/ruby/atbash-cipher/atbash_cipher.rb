class Atbash
  def self.key
    return @key if @key

    @key = {}
    encoded = ('a'..'z').to_a.reverse
    ('a'..'z').each_with_index {|alpha, index| @key[alpha] = encoded[index]}

    @key
  end

  def self.encode(string)
    string = string.downcase.chars.map do |char|
      char.to_i.to_s == char ? char : key.fetch(char, '')
    end

    string = string.join

    string.scan(/.{1,5}/).join(' ')
  end
end
