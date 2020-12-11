require "../common.cr"

class Computer
  include Iterator(Array({acc: Int32, pos: Int32, finished: Bool}))

  @executed_instructions = Set(Int32).new
  @accumulator = 0
  @position = 0

  def initialize(@instructions : Array(String))
  end

  def initialize(instruction_block : String)
    initialize(instruction_block.split("\n"))
  end

  def run
    last = {acc: 0, pos: -1, finished: false}
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

    if @position == @instructions.size
      return {acc: @accumulator, pos: @position, finished: true}
    end

    process_current_line
  end

  private def process_current_line
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
    {acc: @accumulator, pos: @position, finished: false}
  end
end

def fix_program(program : Array(String))
  (0..program.size).each do |fix_position|
    fixed_program = fix_instruction(program, fix_position)
    if !fixed_program
      next
    end
    computer = Computer.new(fixed_program)
    result = computer.run
    if result[:finished]
      return result
    end
  end
end

def fix_instruction(program, fix_position)
  fixed_program = program.dup
  case fixed_program[fix_position][0, 3]
  when "jmp"
    fixed_program[fix_position] = fixed_program[fix_position].sub("jmp", "nop")
    fixed_program
  when "nop"
    fixed_program[fix_position] = fixed_program[fix_position].sub("nop", "jmp")
    fixed_program
  when "acc"
    nil
  else
    raise "unexpected instruction"
  end
end
