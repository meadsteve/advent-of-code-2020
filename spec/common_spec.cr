require "spec"
require "../src/common.cr"

describe "common.cr" do
  describe "GroupedLines" do
    it "Groups into arrays based on blank lines" do
      input = ["a", "b", "", "c", "d"]
      GroupedLines.new(input).to_a.should eq [["a", "b"], ["c", "d"]]
    end
  end
end
