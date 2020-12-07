require "../common.cr"

def input_data
  File.open("./src/day_06/input.txt").each_line
end

def all_answers(answer_lines : Array(String)) : Set(Char)
  all_answers = answer_lines.map(&.chars).reduce do |a, b|
    a.concat(b)
  end
  all_answers.to_set
end

def intersection_of_answers(answer_lines : Array(String)) : Set(Char)
  all_answers = answer_lines.map(&.chars).map(&.to_set).reduce do |a, b|
    a & b
  end
  all_answers.to_set
end
