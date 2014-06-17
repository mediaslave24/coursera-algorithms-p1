require 'spec_helper'

describe WeightedQuickUnionWithPathCompression do
  before do
    @wqu = WeightedQuickUnionWithPathCompression.new(10)
  end

  describe 'root(p)' do
    it 'compresses path' do
      @wqu.union 0, 1
      @wqu.union 3, 2
      @wqu.union 2, 1
      @wqu.union 4, 1

      @wqu.collection.must_equal %w{ 3 3 3 3 3 5 6 7 8 9 }.map(&:to_i)
    end
  end
end
