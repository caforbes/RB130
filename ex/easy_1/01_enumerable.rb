class Node; end

class Tree
  include Enumerable

  def initialize(root = Node.new)
    @nodes = [root]
  end

  def each
    @nodes.each { |node| yield(node) }
    self
  end
end

Tree.new.each { |node| puts node }