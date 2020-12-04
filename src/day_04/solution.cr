def input_data
  File.open("./src/day_04/input.txt").each_line
end

def line_processor(raw_line : String) : Hash(String, String) | Symbol
  if raw_line == ""
    return :end_of_entry
  end
  raw_line.split(" ").map(&.split(":")).to_h
end

class FileOfPassports
  include Iterator(Hash(String, String))
  @lines : Iterator(Hash(String, String) | Symbol)
  @current_passport = {} of String => String
  @stopped = false

  def initialize(@raw_lines : Iterator(String))
    @lines = @raw_lines.map { |l| line_processor(l) }
  end

  def next
    if @stopped
      stop
    else
      load_next_entry
    end
  end

  private def load_next_entry
    new_data = @lines.next
    if new_data.is_a?(Hash(String, String))
      @current_passport = @current_passport.merge(new_data)
      load_next_entry
    elsif new_data == :end_of_entry
      @current_passport
    elsif new_data == Iterator::Stop::INSTANCE
      @stopped = true
      @current_passport
    else
      puts(new_data)
      raise "Unexpected line data"
    end
  end
end
