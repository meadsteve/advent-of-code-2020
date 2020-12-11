require "./solution.cr"

def input_data
  File.open("./src/day_08/input.txt").each_line
end

instructions = input_data.to_a
computer = Computer.new(instructions)

puts computer.run
