require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
  end

  def []=(key, value)
    @items[index(key, size)] = LinkedList.new if @items[index(key, size)] == nil
    @items[index(key, size)].add_to_tail(Node.new(key, value))
    if load_factor > @max_load_factor
      resize
    end
  end

  def [](key)
    list = @items[index(key, size)]
    node = list.head
    while node != nil
      if node.key == key
        return node.value
      end
      node = node.next
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use thegh ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Calculate the current load factor
  def load_factor
    total_size = 0
    @items.each do |list|
      unless list == nil
          node = list.head
        while node != nil
          total_size += 1
          node = node.next
        end
      end
    end
    total_size.to_f / @items.count
  end

  # Simple method to return the number of items in the hash
  def size
    @items.count
  end

  # Resize the hash
  def resize
    newsize = @items.count * 2
    temp_array = Array.new(newsize)
    @items.each do |i|
      if i != nil
        node = i.head
        while node != nil
          temp_array[index(node.key, newsize)] = LinkedList.new if temp_array[index(node.key, newsize)] == nil
          temp_array[index(node.key, newsize)].add_to_tail(node)
          node = node.next
        end
      end
    end
    @items = temp_array
  end
end
