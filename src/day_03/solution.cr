class WrappingString
  @length : Int32

  def initialize(@value : String)
    @length = @value.size
  end

  def [](position : Int)
    @value[position % @length]
  end
end

struct Vector
  property x, y

  def initialize(@x : Int32, @y : Int32)
  end
end

def input_data
  File.open("./src/day_03/input.txt").each_line.map { |raw| WrappingString.new(raw) }
end

TREE = '#'

def count_tress(hill, movement : Vector)
  x = 0
  trees : Int64 = 0
  range = 0..hill.size - 1
  range.step(movement.y) { |y|
    if hill[y][x] == TREE
      trees += 1
    end
    x += movement.x
  }
  trees
end

input_hill = input_data().to_a

# part one
puts(count_tress(input_hill, Vector.new(3, 1)))

# part two
# Right 1, down 1.
# Right 3, down 1. (This is the slope you already checked.)
# Right 5, down 1.
# Right 7, down 1.
# Right 1, down 2.
part_two = [
  count_tress(input_hill, Vector.new(1, 1)),
  count_tress(input_hill, Vector.new(3, 1)),
  count_tress(input_hill, Vector.new(5, 1)),
  count_tress(input_hill, Vector.new(7, 1)),
  count_tress(input_hill, Vector.new(1, 2)),
]

puts(part_two)
puts(part_two.reduce { |acc, n| acc * n })
