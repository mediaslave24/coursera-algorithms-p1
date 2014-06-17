class WeightedQuickUnion < QuickUnion
  def initialize(*)
    super
    @tree_size = Array.new(@size, 1)
  end

  def union(p, q)
    root_p, root_q = root(p), root(q)
    return if root_p == root_q
    if @tree_size[root_p] < @tree_size[root_q]
      @tree_size[root_q] += @tree_size[root_p]
      @collection[root_p] = root_q
    else
      @tree_size[root_p] += @tree_size[root_q]
      @collection[root_q] = root_p
    end
  end

  def tree_size
    @tree_size.dup
  end
end
