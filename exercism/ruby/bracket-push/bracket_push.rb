class Brackets
  OPEN_TO_CLOSE = {'(' => ')', '[' => ']', '{' => '}'}
  def self.paired?(string)
    memory = []
    string.each_char do |char|
      memory << char if OPEN_TO_CLOSE.keys.include? char
      if OPEN_TO_CLOSE.values.include? char
        # If I don't put the parenthesis here it doesn't work; no idea why.
        OPEN_TO_CLOSE[memory[-1]] == char ?  memory.pop : (return false)
      end
    end
    memory.empty?
  end
end

module BookKeeping
  VERSION = 3
end
