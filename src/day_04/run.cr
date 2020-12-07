require "./solution.cr"

valid_passports_one = FileOfPassports
  .new("./src/day_04/input.txt")
  .count(&.valid_for_passport_in_part_one?)

puts(valid_passports_one)

valid_passports_two = FileOfPassports
  .new("./src/day_04/input.txt")
  .count(&.valid_for_passport_in_part_two?)

puts(valid_passports_two)
