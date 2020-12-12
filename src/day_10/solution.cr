def count_gaps(input_numbers : Array(Int32)) : Hash(Int32, Int32)
  answer = {1 => 0, 2 => 0, 3 => 1}            # The last one is always a jump of 3
  numbers = input_numbers.dup.concat([0]).sort # Adding the 0 for the start
  numbers.each_cons_pair do |a, b|
    diff = b - a
    answer[diff] += 1
  end
  answer
end
