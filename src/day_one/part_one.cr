def input_numbers()
  File.open("./src/day_one/input.txt").each_line().map(&.to_i)
end

result = input_numbers().map{ |x|
    input_numbers().select{|y| x + y == 2020}.map{|y| {x, y, x * y}}.to_a
}.to_a()

puts result