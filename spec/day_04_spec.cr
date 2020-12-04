require "spec"
require "../src/day_04/solution.cr"

describe "Day 04 solution" do
  describe "line_processor" do
    it "Returns hashes of the line data" do
      input = "ecl:gry pid:860033327 eyr:2020 hcl:#fffffd"
      expected = {"ecl" => "gry", "pid" => "860033327", "eyr" => "2020", "hcl" => "#fffffd"}
      line_processor(input).should eq expected
    end

    it "Returns markers for the end of entries" do
      line_processor("").should eq :end_of_entry
    end
  end

  describe "passport validation extension to hashes" do
    it "validates correct passports" do
      passport_data = {"ecl" => "gry", "pid" => "860033327", "eyr" => "2020", "hcl" => "#fffffd", "byr" => "1937", "iyr" => "2017", "cid" => "147", "hgt" => "183cm"}
      passport_data.valid_for_passport?.should eq true
    end

    it "rejects incorrect passports" do
      passport_data = {"pid" => "860033327", "eyr" => "2020", "hcl" => "#fffffd", "byr" => "1937", "iyr" => "2017", "cid" => "147", "hgt" => "183cm"}
      passport_data.valid_for_passport?.should eq false
    end
  end

  describe "FileOfPassports" do
    it "Parses the example file correctly" do
      raw = File.open("./src/day_04/example.txt").each_line
      passports = FileOfPassports.new(raw)
      expected = [
        {"ecl" => "gry", "pid" => "860033327", "eyr" => "2020", "hcl" => "#fffffd", "byr" => "1937", "iyr" => "2017", "cid" => "147", "hgt" => "183cm"},
        {"iyr" => "2013", "ecl" => "amb", "cid" => "350", "eyr" => "2023", "pid" => "028048884", "hcl" => "#cfa07d", "byr" => "1929"},
        {"hcl" => "#ae17e1", "iyr" => "2013", "eyr" => "2024", "ecl" => "brn", "pid" => "760753108", "byr" => "1931", "hgt" => "179cm"},
        {"hcl" => "#cfa07d", "eyr" => "2025", "pid" => "166559648", "iyr" => "2011", "ecl" => "brn", "hgt" => "59in"},
      ]

      passports.to_a.should eq expected
    end

    it "Returns markers for the end of entries" do
      line_processor("").should eq :end_of_entry
    end
  end
end
