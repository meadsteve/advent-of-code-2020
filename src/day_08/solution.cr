class LoopDetected < Exception
end

class Computer
  @executed_instructions = Set(Int32).new
  @accumulator = 0
  @position = 0

  def initialize(@instructions : Array(String))
  end

  def initialize(instruction_block : String)
    initialize(instruction_block.split("\n"))
  end

  def run
    while true
        apply_next_instruction
    end
  rescue LoopDetected
    {acc: @accumulator, pos: @position}
  end

  private def apply_next_instruction
    if @executed_instructions.includes?(@position)
      raise LoopDetected.new
    end
    @executed_instructions << @position
    instruction = @instructions[@position].split(" ")
    @position += 1
    case instruction[0]
    when "acc"
      @accumulator += instruction[1].to_i
    when "jmp"
      @position += instruction[1].to_i
    when "nop"
    else
      raise "Invalid instruction"
    end
  end
end
