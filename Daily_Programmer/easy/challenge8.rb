#write a program that will print the song "99 bottles of beer on the wall".
#for extra credit, do not allow the program to print each loop on a new line.

class Integer
  def bottles
    song = "#{self} bottles of beer on the wall. #{self} bottles of beer. "
    song += "Take one down. Pass it around. "
    print song + "#{self} bottles of beer on the wall.  "
    sleep(1)
    print "\r"
    self > 0 ? (self - 1).bottles : return
  end
end

99.bottles
