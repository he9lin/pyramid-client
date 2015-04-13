class BasicObject
  def pipe(func=nil)
    if block_given?
      yield self
    else
      func.call(self)
    end
  end
end

class NilObject
  def pipe(&block)
    self
  end
end
