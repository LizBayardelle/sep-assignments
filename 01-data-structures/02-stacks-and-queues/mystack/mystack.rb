class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack << item
    @top = @stack[-1]
  end

  def pop
    @top = @stack[-2]
    @stack.delete_at(-1)
  end

  def empty?
    @stack == []
  end
end
