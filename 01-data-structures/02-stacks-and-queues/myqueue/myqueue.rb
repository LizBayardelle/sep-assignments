class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue[@queue.count]
  end

  def enqueue(element)
    @queue << element
    @head = @queue[0]
    @tail = element
  end

  def dequeue
    @head = @queue[1]
    @tail = @queue[@queue.count - 1]
    @queue = @queue.delete_at(1)
  end

  def empty?
    @queue == []
  end
end
