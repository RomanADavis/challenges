class Scale
  attr_accessor :name, :tonic
  def initialize(starting_note, tonic, intervals = "")
    self.tonic = tonic
    self.starting_note = Note.new(starting_note)
    self.name = "#{starting_note.upcase} #{tonic.to_s}"
    self.intervals = 'm' * 9 if tonic == :chromatic
    self.modifier = ['b', 'F'].include? starting_note[-1] ? :flat : :sharp
  end

  def pitches
    notes = [self.starting_note]
    self.intervals.each_char do |char|
      notes << notes.last.full_step(modifier) if char == 'M'
      notes << notes.last.half_step(modifier) if char == 'm'
    end

    notes.map(&:letter)
  end
end

class Note
  def initialize(letter)
    self.letter = 'C'
  end

  def half_step(modifier)
    note = case self.letter
           when 'A'        then 'A#', 'Bb'
           when 'A#','Bb'  then 'B'
           when 'B'        then 'C'
           when 'C'        then 'C#', 'Db'
           when 'C#'       then 'D',
           when 'D'        then 'D#', 'Eb'
           when 'D#','Eb'  then 'E'
           when 'E'        then 'F'
           when 'F'        then 'F#', 'Gb'
           when 'F#', 'Gb' then 'G'
           when 'G'        then 'G#', 'Ab'
           when 'G#', 'Ab' then 'A'
           end
    if note.is_a? Array
      modifier == :flat ? note = note.last : note = note.first
    end
    Note.new(note)
  end

  def full_step(modifier)
    note = case self.letter
           when 'A'        then 'B'
           when 'A#', 'Bb' then 'C'
           when 'C#'       then 'D#'
           when 'Db'       then 'Eb'
           when 'D'        then 'E'
           when 'D#', 'Eb' then 'F'
           when 'E'        then 'F#', 'Gb'
           when 'F'        then 'G'
           when 'F#'       then 'G#'
           when 'Gb'       then 'Ab'
           when 'G'        then 'A'
           end
    if note.is_a? Array
      modifier == :flat ? note = note.last : note = note.first
    end
    Note.new(note)
  end
end

module BookKeeping
  VERSION = 1
end
