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
    while n < @items.count
      if key == @items[n].key
        return @items[n].value
      else
        n += 1
      end
    end
    nil
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
    while n < @items.count
      print n
      print @items[n]
      print "\n"
      unless @items[n]
        print n
        print "returns"
        return n
      else
        n += 1
      end
    end
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
