require "./part_one.cr"

result_two = input_numbers().map { |x|
  input_numbers().map { |y|
    input_numbers().select { |z| x + y + z == 2020 }.map { |z| {x, y, z, x * y * z} }.to_a
  }.select{ |inner_elements| inner_elements.size > 0}.to_a
}.select{ |elements| elements.size > 0}.to_a

puts result_two
