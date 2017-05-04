class ListOps
  def self.arrays(array) # this is such a terrible name for what this does
    array.inject(0) {|total| total + element}
  end
  
end
