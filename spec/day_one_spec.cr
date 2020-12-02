require "spec"

describe Array do
  describe "#size" do
    it "correctly reports the number of elements in the Array" do
      [1, "r", 3].size.should eq 3
    end
  end
end
