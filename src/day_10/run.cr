require "./solution.cr"

sizes = File.open("./src/day_10/input.txt").each_line.map { |line| line.to_i }.to_a

gaps = count_gaps(sizes)
puts gaps
puts gaps[1] * gaps[3]
