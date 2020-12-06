require "./solution.cr"

part_one = input_data
    .map{ |raw_row| SeatingPosition.new(raw_row).seat_id}
    .max

puts part_one