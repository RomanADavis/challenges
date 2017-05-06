class Diamond
  ALPHABET = ('A'..'Z').to_a
  def self.make_diamond(letter)
    beginning = ending = ""
    @index = 0
    @size = ALPHABET.find_index(letter) * 2 + 1

    until alpha == letter
      beginning += layer
      ending = "#{layer}#{ending}"
      @index += 1
    end

    middle = layer
    beginning + middle + ending
  end

  private
  def self.alpha
    ALPHABET[@index]
  end

  def self.layer
    content = alpha
    content = "#{alpha}#{' ' * ((@index * 2) - 1)}#{alpha}" unless @index.zero?
    "#{content.center(@size)}\n"
  end
end

module Bookkeeping
  VERSION = 1
end
