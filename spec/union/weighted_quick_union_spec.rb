require 'spec_helper'

describe WeightedQuickUnion do
  before do
    @wqu = WeightedQuickUnion.new(10)
  end

  describe 'union(p, q)' do
    it 'links root of smaller tree to root of larger tree' do
      # Big tree
      # It links 1 to 0, because of weighting
      @wqu.union 0, 1
      # 2 to 0
      @wqu.union 2, 1

      # Small tree
      # 5 to 4
      @wqu.union 4, 5

      # root of 5 (4) to 0
      @wqu.union 2, 5

      @wqu.collection.must_equal %w{ 0 0 0 3 0 4 6 7 8 9 }.map(&:to_i)
    end
  end
end
