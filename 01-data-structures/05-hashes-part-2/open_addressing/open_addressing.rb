require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    if next_open_index(index(key, size)) == -1
      resize
    end
    @items[next_open_index(index(key, size))] = Node.new(key, value)
  end

  def [](key)
    n = index(key, size)
    count = 0
    while @items[n].key != key && count < size
      n = (n + 1) % size
      count += 1
    end
    if @items[n].key == key
      return @items[n].value
    else
      nil
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    n = index
    count = 0
    found = false
    while !found && count < size
     if @items[index] == nil
       found = true
       return index
     else
       index = (index + 1) % size
       count += 1
     end
   end
    # while @items[n].key != key && n < @items.count
    #   print n
    #   if @items[n] == nil
    #     return n
    #   end
    #   n += 1
    # end
    return -1
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
        temp_array[next_open_index(index(i.key, newsize))] = i
      end
    end
    @items = temp_array
  end
end
