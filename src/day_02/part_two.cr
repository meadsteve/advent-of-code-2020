require "./part_one.cr"

def validate_part_two(line : Line)
  matches = {line.password[(line.a - 1)] == line.required_letter, line.password[(line.b - 1)] == line.required_letter}
  matches == {true, false} || matches == {false, true}
end

puts(input_data().count { |line| validate_part_two(line) })
