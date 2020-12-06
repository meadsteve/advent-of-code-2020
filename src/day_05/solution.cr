def input_data
  File.open("./src/day_05/input.txt").each_line
end

class SplittingRange
  def initialize(@lower : Int32, @upper : Int32)
  end

  def upper_half : SplittingRange
    SplittingRange.new(middle + 1, @upper)
  end

  def lower_half : SplittingRange
    SplittingRange.new(@lower, middle)
  end

  def ==(other : SplittingRange) : Bool
    @lower == other.lower && @upper == other.upper
  end

  def lower
    @lower
  end

  def upper
    @upper
  end

  def single_value : Int32
    if @upper != @lower
      raise "Attempted to extract single value from a range: " + @lower.to_s + "," + @upper.to_s
    end
    @upper
  end

  private def middle
    @lower + ((@upper - @lower) / 2).to_i
  end
end

class SeatingPosition
  @row : Int32
  @col : Int32

  def initialize(@seat_string : String)
    row_range = SplittingRange.new(0, 127)
    col_range = SplittingRange.new(0, 7)
    seat_string.chars.each { |char|
      if char == 'F'
        row_range = row_range.lower_half
      elsif char == 'B'
        row_range = row_range.upper_half
      elsif char == 'L'
        col_range = col_range.lower_half
      elsif char == 'R'
        col_range = col_range.upper_half
      end
    }
    @row = row_range.single_value
    @col = col_range.single_value
  end

  def seat_id
    (8 * @row) + @col
  end
end


def part_two_sol(seat_numbers)
    # Once the numbers are sorted whichever pair doesnt
    # increment by 1 are the two next to my seat
    seat_numbers.sort.each_cons_pair{ | a, b |
       if (a - b).abs != 1
         return {a, b}
       end
    }
end