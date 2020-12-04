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
  def valid_for_passport_in_part_one?
    REQUIRED_PASSPORT_KEYS.all? { |key| has_key?(key) }
  end

  def valid_for_passport_in_part_two?
    REQUIRED_PASSPORT_KEYS.all? { |key| has_key?(key) } && all_data_is_valid_for_part_two
  end

  private def all_data_is_valid_for_part_two
    begin
      self["byr"].to_i >= 1920 && self["byr"].to_i <= 2002 && self["iyr"].to_i >= 2010 && self["iyr"].to_i <= 2020 && self["eyr"].to_i >= 2020 && self["eyr"].to_i <= 2030 && valid_height(self["hgt"]) && self["hcl"].matches?(/\#[a-f0-9]{6}/) && self["ecl"].matches?(/(amb|blu|brn|gry|grn|hzl|oth)/) && self["pid"].matches?(/[0-9]{9}/)
    rescue
      # being lazy so any exception probably means invalid
      false
    end
  end

  private def valid_height(height : String)
    match = height.match(/([0-9].)(cm|in)/)
    if !match
      false
    elsif match[2] == "cm"
      match[1].to_i >= 150 && match[1].to_i <= 193
    elsif match[2] == "in"
      match[1].to_i >= 59 && match[1].to_i <= 76
    end
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
