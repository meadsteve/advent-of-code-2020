require "../common.cr"


class Computer
  include Iterator(Array({acc: Int32, pos: Int32}))

  @executed_instructions = Set(Int32).new
  @accumulator = 0
  @position = 0

  def initialize(@instructions : Array(String))
  end

  def initialize(instruction_block : String)
    initialize(instruction_block.split("\n"))
  end

  def run
    last = nil
    self.each do |element|
        last = element
    end
    last
  end

  def next
    if @executed_instructions.includes?(@position)
      return stop
    end
    @executed_instructions << @position
    instruction = @instructions[@position].split(" ")
    case instruction[0]
    when "acc"
      @accumulator += numberish(instruction[1])
      @position += 1
    when "jmp"
      @position += numberish(instruction[1])
    when "nop"
      @position += 1
    else
      raise "Invalid instruction"
    end
    {acc: @accumulator, pos: @position}
  end
end
