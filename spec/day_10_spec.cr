require "spec"
require "../src/day_10/solution.cr"

describe "Day 10 solution" do
  describe "count_gaps" do
    it "counts the gaps (after sorting)" do
      numbers = [16, 10, 15, 5, 1, 11, 7, 19, 6, 12, 4]
      expected = {1 => 7, 2 => 0, 3 => 5}
      count_gaps(numbers).should eq expected
    end
  end
end
