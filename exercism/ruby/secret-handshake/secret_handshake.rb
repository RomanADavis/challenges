class SecretHandshake
  attr_accessor :commands
  def initialize(decimal)
    self.commands = []
    return unless decimal.to_s.to_i == decimal
    binary = decimal.to_s(2)


    self.commands << "wink" if binary[-1] == '1'
    self.commands << "double blink" if binary[-2] == '1'
    self.commands << "close your eyes" if binary[-3] == '1'
    self.commands << "jump" if binary[-4] == '1'
    self.commands.reverse! if binary[-5] == '1'
  end
end
