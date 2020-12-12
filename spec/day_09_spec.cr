require "spec"
require "../src/day_09/solution.cr"

describe "Day 09 solution" do
  describe "something" do
    it "does something" do
      numbers = [35, 20, 15, 25, 47, 40, 62, 55, 65, 95, 102, 117, 150, 182, 127, 219, 299, 277, 309, 576]
      first_bad_number(numbers, preamble_length: 5).should eq 127
    end
  end
end
