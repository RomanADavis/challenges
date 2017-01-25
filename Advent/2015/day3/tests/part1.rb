require "minitest/autorun"
require "./solutions/part1"

describe Map do

  describe "new" do
    it "initializes the map with one house" do
      Map.new.houses.length.must_equal 1
    end
  end

  describe "go" do
    it "adds one house" do
      Map.new.go(">").houses.length.must_equal 2
    end
  end

  describe "travel" do
    it "adds locations for each direction in directions" do
      Map.new.travel(">").houses.length.must_equal 2
      Map.new.travel("^>v<").houses.length.must_equal 4
      Map.new.travel("^v^v^v^v^v").houses.length.must_equal 2
    end
  end
end
