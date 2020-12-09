require "spec"
require "../src/day_07/solution.cr"

describe "Day 07 solution" do
  describe "BagRules" do
    it "Bags are created uniquely by name" do
      rules = BagRules.new
      bag_one = rules["vermillion"]
      bag_two = rules["vermillion"]
      bag_one.should be bag_two
    end

    it "Links can be created and work at one level" do
      rules = BagRules.new
      rules.add_link("vermillion", can_be_contained_by: "octamarine")
      rules["vermillion"].all_possible_containers.to_a.should eq [rules["octamarine"]]
    end

    it "Links can be created and work at multiple levels" do
      rules = BagRules.new
      rules.add_link("vermillion", can_be_contained_by: "octamarine")
      rules.add_link("octamarine", can_be_contained_by: "periwinkle blue")
      rules["vermillion"].all_possible_containers.to_a.should eq [rules["octamarine"], rules["periwinkle blue"]]
    end
  end

  describe "LineParser" do
    line = "light red bags contain 1 bright white bag, 2 muted yellow bags."
    expected = {
      bag:         "light red",
      can_contain: [{colour: "bright white", count: 1}, {colour: "muted yellow", count: 2}],
    }
    parse_line(line).should eq expected
  end
end
