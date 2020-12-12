require "spec"
require "../src/day_09/solution.cr"

describe "Day 09 solution" do
  describe "first_bad_number finder" do
    it "finds the first number that isn't the sum of a pair in the X previous" do
      numbers : Array(Int64) = [35, 20, 15, 25, 47, 40, 62, 55, 65, 95, 102, 117, 150, 182, 127, 219, 299, 277, 309, 576].map { |x| x.to_i64 }
      first_bad_number(numbers, preamble_length: 5).should eq 127
    end
  end

  describe "summing_range finder" do
    it "finds the continous range that sums to a target" do
      numbers = [35, 20, 15, 25, 47, 40, 62, 55, 65, 95, 102, 117, 150, 182, 127, 219, 299, 277, 309, 576].map { |x| x.to_i64 }
      find_summing_range(numbers, target: 127).should eq [15, 25, 47, 40]
    end
  end
end
