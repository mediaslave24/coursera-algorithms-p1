class Union
  attr_reader :size
  def initialize(size)
    @size = size.to_i
    reset!
  end

  def collection
    @collection.dup
  end

  def reset!
    @collection = (0...@size).to_a
    nil
  end
end
