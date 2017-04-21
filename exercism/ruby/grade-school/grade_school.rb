class School < Struct.new(:grades)
  def initialize
    self.grades = Hash.new([])
  end

  def add(name, grade)
    self.grades[grade] = self.grades[grade] + [name]
  end

  def students(grade)
    self.grades[grade].sort
  end

  def students_by_grade
    self.grades.sort.map {|key, val| {grade: key, students: val.sort}}
  end
end

class BookKeeping
  VERSION = 3
end
