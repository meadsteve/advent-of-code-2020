require "./solution.cr"

valid_passports = FileOfPassports
  .new("./src/day_04/input.txt")
  .select(&.valid_for_passport?)
  .size
puts(valid_passports)
