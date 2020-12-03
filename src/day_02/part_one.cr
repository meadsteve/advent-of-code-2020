def input_data
  File.open("./src/day_02/input.txt").each_line.map { |raw| parse_line(raw) }
end

struct Line
  property a, b, required_letter, password

  def initialize(@a : Int32, @b : Int32, @required_letter : Char, @password : String)
  end
end

def parse_line(raw_input)
  match = raw_input.match(/([0-9]+)-([0-9]+) ([a-zA-Z]): (.+)/)
  if !match
    raise "bad input: " + raw_input
  end
  Line.new(match[1].to_i, match[2].to_i, match[3][0], match[4])
end

def validate_part_one(line : Line)
  occurances = line.password.count(line.required_letter)
  occurances >= line.a && occurances <= line.b
end

puts(input_data().count { |line| validate_part_one(line) })
