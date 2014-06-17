require 'union'

class QuickFind < Union
  def union(p, q)
    a, b = @collection[p], @collection[q]
    @collection.each_with_index do |n, i|
      @collection[i] = b if n == a
    end
  end

  def connected?(p, q)
    @collection[p] == @collection[q]
  end
end
