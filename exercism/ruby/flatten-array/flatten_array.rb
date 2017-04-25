class FlattenArray
  VERSION = 1
  def self.flatten(array)
    return array if array.none? {|element| element.is_a?(Array) || element.nil?}
    result = []
    array.reject! {|element| element.nil?}
    array.each do |element|
      element.is_a?(Array) ? element.each {|i| result << i} : result << element
    end
    flatten(result)
  end
end
