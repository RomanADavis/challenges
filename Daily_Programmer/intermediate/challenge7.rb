#Write a program that draws a recursive image.
#For example, a Sierpinski triangle, a Barnsley fern, or a Mandelbrot set
#fractal would be good drawings.
#Any recursive image will do, but try to make them look fun or interesting.
#Bonus points for adding a color scheme!
#Please post a link to a sample image produced by your program, and above all,
#be creative.

#Honestly, this is largely stolen from
#https://www.ruby-forum.com/topic/109325
#still, really interesting!

class Fractal
  def initialize(width = 100, height = 100)
    @x = 0
    @y = height - 1
    @direction = :east
    @canvas = Array.new(height) { Array.new(width) {" "} }
  end

  def turn way
    case [@direction, way]
    when [:west, :left], [:east, :right]
      go :south
    when [:east, :left], [:west, :right]
      go :north
    when [:south, :left], [:north, :right]
      go :east
    when [:north, :left], [:south, :right]
      go :west
    end
    self
  end

  def go direction
    case direction
    when :north
      @y -= 1
    when :south
      @y += 1
    when :east
      @x += 1
    when :west
      @x -= 1
    end
    @direction = direction
    self
  end


  def move
    mark
    go @direction
    mark
    self
  end

  def mark
    case @direction
    when :east, :west
      @canvas[@y][@x] = "_"
    when :north, :south
      @canvas[@y][@x] = "|"
    end
  end

  def draw depth
    if depth.zero?
      move
    else
      draw depth - 1
      turn :left
      draw depth - 1
      turn :right
      draw depth - 1
      turn :right
      draw depth - 1
      turn :left
      draw depth - 1
    end
  end

  def show
    @canvas.each { |row| puts row.join() }
  end
end

Fractal.new.draw(3).show
