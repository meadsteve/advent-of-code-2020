def first_bad_number(all_numbers : Array(Int64), preamble_length : Int32) : Int64
  all_numbers.each_with_index.skip(preamble_length).each do |number, index|
    previous_numbers = all_numbers[index - preamble_length, preamble_length]
    if !is_sum_of_two_previous(number, previous_numbers)
      return number
    end
  end
  raise "not found"
end

def first_bad_number(all_numbers : Iterator(Int64), preamble_length : Int32)
  first_bad_number(all_numbers.to_a, preamble_length)
end

def is_sum_of_two_previous(number : Int64, previous_numbers : Array(Int64))
  previous_numbers.each_combination(2).each do |pair|
    if pair[0] + pair[1] == number
      return true
    end
  end
  false
end

def find_summing_range(all_numbers : Array(Int64), target : Int64) : Array(Int64)
  (0..all_numbers.size).each do |start_pos|
    (start_pos..all_numbers.size).each do |end_pos|
      numbers = all_numbers[(start_pos..end_pos)]
      if numbers.sum == target
        return numbers
      end
    end
  end
  raise "not found"
end
