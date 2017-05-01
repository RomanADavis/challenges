require "./solutions/part1"
require "minitest/autorun"

describe Circuit do
  before do
    @circuit = Circuit.new
  end

  describe "initialize" do
    it "starts with an empty environment" do
      @circuit.environment.must_equal({})
    end
  end

  describe "parse" do
    it "can successfully set a signal to a wire in the environment" do
      @circuit.parse("500 -> x")
      @circuit.environment.must_equal({"x" => 500})
    end

    it "sets the wire to the signal of another wire when that wire is in the env" do
      @circuit.parse("500 -> x")
      @circuit.parse("x -> y")
      @circuit.environment["y"].must_equal 500
    end

    it "can calculate and set a binary and" do
      @circuit.parse("7 AND 3 -> a")
      @circuit.environment.must_equal({"a" => 3})
    end

    it "can calculate and store a binary or" do
      @circuit.parse("8 OR 16 -> a")
      @circuit.environment.must_equal("a" => 24)
    end
  end
end
