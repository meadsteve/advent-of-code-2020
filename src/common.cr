class GroupedLines
  include Iterator(Array(String))
  @lines : Iterator(String)
  @current_group = [] of String
  @stopped = false

  def initialize(@lines : Iterator(String))
  end

  def initialize(array_of_lines : Array(String))
    initialize(array_of_lines.each)
  end

  def initialize(file_path : String)
    initialize(File.open(file_path).each_line)
  end

  def next
    if @stopped
      stop
    else
      load_next_entry
    end
  end

  private def load_next_entry
    new_line = @lines.next
    case new_line
    when Iterator::Stop::INSTANCE
      @stopped = true
      @current_group
    when ""
      group_to_emit = @current_group
      @current_group = [] of String
      group_to_emit
    when String
      @current_group << new_line
      load_next_entry
    else
      raise "oh no"
    end
  end
end

def numberish(numberlike : String) : Int32
  parts = numberlike.match(/([+\-])([0-9]+)/)
  if !parts
    raise "not number like"
  end
  case parts[1]
  when "+"
    parts[2].to_i
  when "-"
    parts[2].to_i * -1
  else
    raise "not number like"
  end
end
