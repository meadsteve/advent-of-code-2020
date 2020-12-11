require "spec"
require "../src/common.cr"

describe "common.cr" do
  describe "GroupedLines" do
    it "Groups into arrays based on blank lines" do
      input = ["a", "b", "", "c", "d"]
      GroupedLines.new(input).to_a.should eq [["a", "b"], ["c", "d"]]
    end
  end

  describe "numberish" do
    it "handles positive numbers" do
      numberish("+5").should eq 5
    end
    it "handles positive zero" do
      numberish("+0").should eq 0
    end
    it "handles negative numbers" do
      numberish("-3").should eq -3
    end
    it "handles negative zero" do
      numberish("-0").should eq 0
    end
  end
end
