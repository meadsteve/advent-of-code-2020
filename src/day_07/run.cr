require "./solution.cr"

def input_data
  File.open("./src/day_07/input.txt").each_line
end

rules = BagRules.new
input_data()
  .map { |it| parse_line(it) }
  .each do |line|
    line[:can_contain].each do |containee|
      rules.add_link(containee, can_be_contained_by: line[:bag])
    end
  end

puts rules["shiny gold"].all_possible_containers.size
