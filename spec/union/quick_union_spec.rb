require 'spec_helper'

describe QuickUnion do
  before do
    @qu = QuickUnion.new(10)
  end

  describe 'union(p,q)' do
    it 'sets id[p] root to id[q] root' do
      @qu.union 0, 1
      @qu.union 1, 2
      @qu.union 2, 3
      @qu.union 5, 4
      @qu.union 5, 0
      @qu.union 9, 0

      @qu.collection.must_equal %w{ 1 2 3 3 3 4 6 7 8 3 }.map(&:to_i)

      @qu.reset!

      @qu.union 2, 3
      @qu.union 4, 5
      @qu.union 2, 4
      @qu.collection.must_equal %w{ 0 1 3 5 5 5 6 7 8 9 }.map(&:to_i)
    end
  end

  describe 'connected?(p,q)' do
    it 'is true when p and q has same roots' do
      @qu.union 0, 1
      @qu.connected?(0, 1).must_equal true

      @qu.union 4, 5
      @qu.connected?(0, 4).must_equal false

      @qu.union 0, 4
      @qu.connected?(0, 4).must_equal true
      @qu.connected?(1, 5).must_equal true
    end
  end
end
