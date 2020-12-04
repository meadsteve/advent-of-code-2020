def input_data
  File.open("./src/day_04/input.txt").each_line
end

def line_processor(raw_line : String) : Hash(String, String) | Symbol
  if raw_line == ""
    return :end_of_entry
  end
  raw_line.split(" ").map(&.split(":")).to_h
end

REQUIRED_PASSPORT_KEYS = [
  "byr",
  "iyr",
  "eyr",
  "hgt",
  "hcl",
  "ecl",
  "pid",
  # "cid", #LOL HACK THE SYSTEM
]

class Hash
  def valid_for_passport?
    REQUIRED_PASSPORT_KEYS.all? { |key| has_key?(key) }
  end
end

class FileOfPassports
  include Iterator(Hash(String, String))
  @lines : Iterator(Hash(String, String) | Symbol)
  @current_passport = {} of String => String
  @stopped = false

  def initialize(@raw_lines : Iterator(String))
    @lines = @raw_lines.map { |l| line_processor(l) }
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
    new_data = @lines.next
    if new_data.is_a?(Hash(String, String))
      @current_passport = @current_passport.merge(new_data)
      load_next_entry
    elsif new_data == :end_of_entry
      new_passport = @current_passport
      @current_passport = {} of String => String
      new_passport
    elsif new_data == Iterator::Stop::INSTANCE
      @stopped = true
      @current_passport
    else
      puts(new_data)
      raise "Unexpected line data"
    end
  end
end
