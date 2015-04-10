class BasicObject
  def pipe(&block)
    block.call(self)
  end
end
