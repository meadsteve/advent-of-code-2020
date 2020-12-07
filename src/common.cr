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
    if new_line == Iterator::Stop::INSTANCE
      @stopped = true
      @current_group
    elsif new_line == ""
      group_to_emit = @current_group
      @current_group = [] of String
      group_to_emit
    elsif new_line.is_a?(String)
      @current_group << new_line
      load_next_entry
    else
      raise "oh no"
    end
  end
end
