class Integer
  def pentagonal
    self * (3 * self - 1) / 2
  end

  def pentagonal? # Courtesy of Wikipedia
    (((24 * self + 1)**0.5 + 1) / 6.0) % 1 == 0
  end
end



j = 1
solved = false
until solved
  j += 1
  pj = j.pentagonal
  (1..(j - 1)).map(&:pentagonal).reverse_each do |pk|
    if (pj - pk).pentagonal? && (pj + pk).pentagonal?
      p pj - pk
      solved = true
    end
  end
end
