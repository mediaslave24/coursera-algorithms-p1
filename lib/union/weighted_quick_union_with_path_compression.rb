class WeightedQuickUnionWithPathCompression < WeightedQuickUnion
  def root(p)
    while @collection[p] != p do
      @collection[p] = @collection[ @collection[p] ]
      p = @collection[p]
    end
    p
  end
end
