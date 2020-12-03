def input_data
  File.open("./src/day_two/input.txt").each_line.map{|raw| parse_line(raw)}
end

struct Line
  property min, max, required_letter, password

  def initialize(@min : Int32, @max : Int32, @required_letter : Char, @password : String)
  end
end

def parse_line(raw_input)
   match = raw_input.match(/([0-9]+)-([0-9]+) ([a-zA-Z]): (.+)/)
   if !match
     raise "bad input: " + raw_input
   end
   Line.new(match[1].to_i, match[2].to_i, match[3][0], match[4])
end

def validate(line : Line)
    occurances = line.password.count(line.required_letter)
    occurances >= line.min && occurances <= line.max
end

puts(input_data().select { |line| validate(line)}.size)