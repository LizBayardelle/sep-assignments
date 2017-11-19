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
    @queue = @queue.drop(1)
    @head = @queue[0]
    @tail = @queue[@queue.count]
  end

  def empty?
    @queue == []
  end
end
