class Proverb
  def initialize(*items, **options)
    @items = items
    @qualifier = options[:qualifier] ? "#{options[:qualifier]} " : ""
  end

  def to_s
    want = @items.first

    poem = ""
    @items.each_cons(2) do |a, b|
      poem += "For want of a #{a} the #{b} was lost.\n"
    end

    poem + "And all for the want of a #{@qualifier}#{want}."
  end
end
