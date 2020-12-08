class BagNode
  @can_contain = [] of BagNode
  @can_be_contained_by = [] of BagNode

  def initialize(@bag_name : String)
  end

  def can_contain(content_bag : BagNode)
    @can_contain << content_bag
  end

  def can_be_contained_by(containing_bag : BagNode)
    @can_be_contained_by << containing_bag
  end

  def all_possible_containers : Array(BagNode)
    @can_be_contained_by + @can_be_contained_by.flat_map(&.all_possible_containers)
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
