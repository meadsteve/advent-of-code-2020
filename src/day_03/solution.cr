
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
    position = Vector.new(0, 0)
    trees = 0
    hill.each { |slice|
      if slice[position.x] == TREE && (position.y % movement.y == 0)
         trees += 1
      end
      position.x += movement.x
      position.y += movement.y
    }
    trees
end

input_hill = input_data().to_a

# part one
puts(count_tress(input_hill, Vector.new(3, 1)))