require 'spec_helper'

describe QuickFind do
  before do
    @qf = QuickFind.new(10)
  end

  describe 'union(q,p)' do
    it 'connects "p" and "q" by changing all entries, whose id equals id[p] to id[q]' do
      @qf.union 0, 5
      @qf.union 1, 5
      @qf.collection.must_equal %w{ 5 5 2 3 4 5 6 7 8 9 }.map(&:to_i)

      @qf.reset!

      @qf.union 2, 3
      @qf.union 1, 3
      @qf.union 3, 7

      @qf.collection.must_equal %w{ 0 7 7 7 4 5 6 7 8 9 }.map(&:to_i)
    end
  end

  describe 'connected?(p,q)' do
    it 'is true when id[p] == id[q]' do
      @qf.union 0, 5
      @qf.union 1, 5
      @qf.union 5, 9

      @qf.connected?(0, 9).must_equal true
      @qf.connected?(0, 8).must_equal false
      @qf.connected?(0, 7).must_equal false
      @qf.connected?(0, 1).must_equal true
      @qf.connected?(0, 2).must_equal false
      @qf.connected?(0, 5).must_equal true
      @qf.connected?(2, 3).must_equal false
      @qf.connected?(1, 5).must_equal true
      @qf.connected?(9, 1).must_equal true
    end
  end
end
