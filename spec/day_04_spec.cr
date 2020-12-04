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

  describe "FileOfPassports" do
    it "Parses the example file correctly" do
      raw = File.open("./src/day_04/example.txt").each_line
      passports = FileOfPassports.new(raw)
      expected = [
        {"ecl" => "gry", "pid" => "860033327", "eyr" => "2020", "hcl" => "#fffffd", "byr" => "1937", "iyr" => "2017", "cid" => "147", "hgt" => "183cm"},
        {"ecl" => "amb", "pid" => "028048884", "eyr" => "2023", "hcl" => "#cfa07d", "byr" => "1929", "iyr" => "2013", "cid" => "350", "hgt" => "183cm"},
        {"ecl" => "brn", "pid" => "760753108", "eyr" => "2024", "hcl" => "#ae17e1", "byr" => "1931", "iyr" => "2013", "cid" => "350", "hgt" => "179cm"},
        {"ecl" => "brn", "pid" => "166559648", "eyr" => "2025", "hcl" => "#cfa07d", "byr" => "1931", "iyr" => "2011", "cid" => "350", "hgt" => "59in"},
      ]

      passports.to_a.should eq expected
    end

    it "Returns markers for the end of entries" do
      line_processor("").should eq :end_of_entry
    end
  end
end
