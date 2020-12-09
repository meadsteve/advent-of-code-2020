require "./solution.cr"

def input_data
  File.open("./src/day_07/input.txt").each_line
end

rules = BagRules.new
input_data()
  .map { |it| parse_line(it) }
  .each do |line|
    line[:should_contain].each do |containee|
      rules.add_link(line[:bag], should_contain: containee)
    end
  end

puts rules["shiny gold"].all_possible_containers.size
puts rules["shiny gold"].bags_contained
