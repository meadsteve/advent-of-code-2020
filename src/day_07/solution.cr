class BagNode
  @can_contain = Set(BagNode).new
  @can_be_contained_by = Set(BagNode).new

  def initialize(@bag_name : String)
  end

  def can_contain(content_bag : BagNode)
    @can_contain << content_bag
  end

  def can_be_contained_by(containing_bag : BagNode)
    @can_be_contained_by << containing_bag
  end

  def all_possible_containers : Set(BagNode)
    @can_be_contained_by.concat(
      @can_be_contained_by.map(&.all_possible_containers).flat_map(&.to_a)
    )
  end
end

class BagRules
  @bag_index = {} of String => BagNode

  def add_link(bag : String, can_be_contained_by : String)
    content_bag = self[bag]
    container_bag = self[can_be_contained_by]
    content_bag.can_be_contained_by(container_bag)
    container_bag.can_contain(content_bag)
    self
  end

  def [](bag_name : String)
    if @bag_index.has_key? bag_name
      @bag_index[bag_name]
    else
      new_bag = BagNode.new(bag_name)
      @bag_index[bag_name] = new_bag
      new_bag
    end
  end
end

def parse_line(line : String) : {bag: String, can_contain: Array({colour: String, count: Int32})}
  pair = line.split(" bags contain ")
  possible_contents = pair[1].split(",")
    .map { |it| it.match(/([0-9]+) ([a-z ]+) bags?.?/) }
    .select(Regex::MatchData)
    .map { |it| {colour: it[2], count: it[1].to_i} }
  {bag: pair[0], can_contain: possible_contents}
end
