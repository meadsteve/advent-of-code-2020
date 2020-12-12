require "./solution.cr"

def input_data
  File.open("./src/day_09/input.txt").each_line.map {|line| line.to_i64}
end

puts first_bad_number(input_data, preamble_length: 25)
