require "./solutions/part2.rb"
require "minitest/autorun"

describe "lets_split_up" do
  it "alternates between robo_santa and santa" do
    lets_split_up("^v").must_equal 3
    lets_split_up("^v^v^v^v^v").must_equal 11
  end
end
