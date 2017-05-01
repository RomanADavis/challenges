require "minitest/autorun"
require "./solutions/part2.rb"

describe "ribbon" do
  it "returns the perimeter of the smallest side plus it's volume" do
    ribbon("2x3x4").must_equal 34
    ribbon("1x1x10").must_equal 14
  end
end
