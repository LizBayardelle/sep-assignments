require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @head == nil
      @head = node
      @tail = node
    else
      @tail.next = node
      @tail = node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if @head == @tail
      @head = nil
      @tail = nil
    elsif @head.next = nil
      @tail = @head
    else
      temp = @head
      while temp.next != nil && temp.next != @tail
        temp = temp.next
      end
      @tail = temp
      @tail.next = nil
    end
  end

  # This method prints out a representation of the list.
  def print
    list = ""
    temp = @head
    while temp.next != nil
      list += temp.data + "\n"
      temp = temp.next
    end
    list += temp.data + "\n"
    puts list
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    temp = @head
    if node == @head
      @head = @head.next
    else

      while temp.next != nil
        if temp.next != node
          temp = temp.next
        else
          if @tail == node
            @tail = temp
          end
          temp.next = temp.next.next
        end
      end

    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if @tail == nil
      @tail = node
    end
    node.next = @head
    @head = node
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    temp = @head
    if @tail == @head
      @tail = nil
    end
    @head = @head.next
    temp
  end
end
