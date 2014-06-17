class QuickUnion < Union
  def union(p, q)
    p_root = root(@collection[p])
    q_root = root(@collection[q])
    @collection[p_root] = q_root
  end

  def root(p)
    if @collection[p] == p then p else root(@collection[p]) end
  end

  def connected?(p, q)
    root(@collection[p]) == root(@collection[q])
  end
end
