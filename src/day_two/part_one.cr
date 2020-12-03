
struct Line
  property min, max, letter, password

  def initialize(@min : Int32, @max : Int32, @letter : Char, @password : String)
  end
end

def parse_line(raw_input)
   match = raw_input.match(/([0-9])+-([0-9])+ ([a-zA-Z]): (.+)/)
   if !match
     raise "OH NO!"
   end
   Line.new(match[1].to_i, match[2].to_i, match[3][0], match[4])
end


puts(parse_line("1-3 a: abcde"))