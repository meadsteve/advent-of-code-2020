require "../common.cr"

def input_data
  File.open("./src/day_06/input.txt").each_line
end

def set_of_answers(answer_lines : Array(String)) : Set(Char)
  all_answers = answer_lines.map(&.chars).reduce do |a, b|
    a.concat(b)
  end
  all_answers.to_set
end

part_one = GroupedLines.new(input_data)
  .map { |answers| set_of_answers(answers) }
  .map(&.size)
  .sum

puts part_one
