class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    if @items[index(key, size)] && @items[index(key, size)].value != value
      resize
    end
    @items[index(key, size)] = HashItem.new(key, value)
    print index(key,size)
  end


  def [](key)
    @items[index(key, size)].value
  end

  def resize
    newsize = @items.count * 2
    temp_array = Array.new(newsize)
    @items.each do |i|
      if i != nil
        temp_array[index(i.key, newsize)] = i
      end
    end
    @items = temp_array
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.count
  end

end
