class Bob
  def self.hey(remark)
    return 'Whoa, chill out!' if remark == remark.upcase && remark != remark.downcase
    return "Sure." if remark[-1] == '?'
    return "Fine. Be that way!" if remark.strip.empty?
    "Whatever."
  end
end
