require "./solution.cr"

raw = File.open("./src/day_04/example.txt").each_line
passports = FileOfPassports.new(raw)

puts(passports.to_a)
