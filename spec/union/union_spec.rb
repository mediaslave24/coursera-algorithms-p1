require 'spec_helper'

describe Union do
  before do
    @union = Union.new(10)
  end

  it 'has integer size' do
    union = Union.new('10')
    union.size.must_equal 10
  end

  it 'has #collection' do
    @union.collection.must_equal [0,1,2,3,4,5,6,7,8,9]
  end
end
