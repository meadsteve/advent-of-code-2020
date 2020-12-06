require "spec"
require "../src/day_05/solution.cr"

describe "Day 05 solution" do
  describe "SplittingRange" do
    it "Can be compared by value" do
      a = SplittingRange.new(0, 127)
      b = SplittingRange.new(0, 127)
      a.should eq b
    end
    it "Can pick the upper half of a range" do
      input = SplittingRange.new(0, 127)
      expected = SplittingRange.new(64, 127)
      input.upper_half.should eq expected
    end
    it "Can pick the lower half of a range" do
      input = SplittingRange.new(32, 63)
      expected = SplittingRange.new(32, 47)
      input.lower_half.should eq expected
    end

    it "Can pick down to a single number" do
      input = SplittingRange.new(44, 44)
      input.single_value.should eq 44
    end

    it "Can raises an exception if a single value is extracted from a range" do
      input = SplittingRange.new(44, 45)
      expect_raises Exception do
        input.single_value
      end
    end
  end

  describe "SeatingPosition" do
    it "Turns a string into a seat id" do
      SeatingPosition.new("FBFBBFFRLR").seat_id.should eq 357
    end
  end
end
