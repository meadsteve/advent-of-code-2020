require "./solution.cr"

seat_numbers = input_data
                   .map{ |raw_row| SeatingPosition.new(raw_row).seat_id}
                   .to_a

part_one = seat_numbers.max
puts part_one

puts part_two_sol(seat_numbers)