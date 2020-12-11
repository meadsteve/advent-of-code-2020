require "spec"
require "../src/day_08/solution.cr"

describe "Day 08 solution" do
  describe "Computer" do
    it "computes" do
      computer = Computer.new(
        <<-INSTR
       nop +0
       acc +1
       jmp +4
       acc +3
       jmp -3
       acc -99
       acc +1
       jmp -4
       acc +6
       INSTR
      )
      computer.run[:acc].should eq 5
    end

    it "can terminate normally" do
      computer = Computer.new(
        <<-INSTR
       nop +0
       acc +1
       jmp +4
       acc +3
       jmp -3
       acc -99
       acc +1
       nop -4
       acc +6
       INSTR
      )
      computer.run[:finished].should eq true
    end
  end
end
