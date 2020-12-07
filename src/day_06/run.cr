require "./solution.cr"

part_one = GroupedLines.new(input_data)
  .map { |answers| all_answers(answers) }
  .map(&.size)
  .sum

puts part_one

part_two = GroupedLines.new(input_data)
  .map { |answers| intersection_of_answers(answers) }
  .map(&.size)
  .sum

puts part_two
