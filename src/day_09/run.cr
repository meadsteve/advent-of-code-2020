require "./solution.cr"

numbers = File.open("./src/day_09/input.txt").each_line.map { |line| line.to_i64 }.to_a

first_bad_number = first_bad_number(numbers, preamble_length: 25)
puts first_bad_number

summing_range = find_summing_range(numbers, target: first_bad_number)
puts summing_range.min + summing_range.max

