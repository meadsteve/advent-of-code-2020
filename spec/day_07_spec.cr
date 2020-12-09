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
      rules.add_link("octamarine", should_contain: {colour: "vermillion", count: 1})
      rules["vermillion"].all_possible_containers.to_a.should eq [rules["octamarine"]]
    end

    it "Links can be created and work at multiple levels" do
      rules = BagRules.new
      rules.add_link("octamarine", should_contain: {colour: "vermillion", count: 1})
      rules.add_link("periwinkle blue", should_contain: {colour: "octamarine", count: 2})
      rules["vermillion"].all_possible_containers.to_a.should eq [rules["octamarine"], rules["periwinkle blue"]]
    end

    it "The links also store the counts of containers" do
      rules = BagRules.new
      rules.add_link("octamarine", should_contain: {colour: "vermillion", count: 1})
      rules.add_link("periwinkle blue", should_contain: {colour: "octamarine", count: 2})

      # 2 * octamarine + 2 vermillion (inside the octamarine)
      rules["periwinkle blue"].bags_contained.should eq 4
    end
  end

  describe "LineParser" do
    it "parses lines" do
      line = "light red bags contain 1 bright white bag, 2 muted yellow bags."
      expected = {
        bag:            "light red",
        should_contain: [{colour: "bright white", count: 1}, {colour: "muted yellow", count: 2}],
      }
      parse_line(line).should eq expected
    end
  end
end
