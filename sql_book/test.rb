module Greenable
  # p Module.nesting
  def is_green
    DECIDUOUS ? "Maybe" : "Yes"
  end
end

class Tree
  DECIDUOUS = true

  include Greenable
  # p Module.nesting

  def sheds_leaves?
    DECIDUOUS
  end
end

module Evergreen
  DECIDUOUS = false
  # p Module.nesting
  class Spruce < Tree
    def changes_color?
      p Module.nesting # [Evergreen::Spruce, Evergreen]
      DECIDUOUS
    end
  end
end

blue_spruce = Evergreen::Spruce.new
# p blue_spruce
# p blue_spruce.class.ancestors # [Evergreen::Spruce, Tree, Greenable, Object, Kernel, BasicObject]
# What does each line below output and why?

p blue_spruce.changes_color? #false
p blue_spruce.class::DECIDUOUS #true
p blue_spruce.sheds_leaves? #true
p blue_spruce.is_green # "Maybe" (after we modify the code to refer to the class of the calling object)