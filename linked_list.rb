class Node
  attr_accessor :data, :next_node
  def initialize(data, next_node= nil)
    @data = data
    @next_node = next_node
  end
end

class LinkedList
  def is_empty?
    if defined?(@head) == nil # returns nil if var is undefined, then matches the statement
      return true
    else
      return false
    end
  end

  def append(data)
    new_node = Node.new(data)
    if self.is_empty?
      @head = new_node
    else
     current_node = @head
     while current_node.next_node != nil # runs if head was already given pointed to the next node
       current_node = current_node.next_node # changes var to next node
     end
      current_node.next_node = new_node # last added node is the new node instatiated
    end
  end

  def prepend(data)
    new_node = Node.new(data)
    if is_empty?
      @head = new_node
    else
      new_node.next_node = @head
      @head = new_node
    end
  end

  def tail
    if is_empty?
      return nil
    else
      current_node = @head
      while current_node.next_node != nil
       current_node = current_node.next_node
     end
     current_node
    end
  end

  def head
    if is_empty?
      nil
    else
      current_node = @head
      current_node.next_node = nil
      current_node
    end
  end

  def size
    if is_empty?
      0
    else
      count = 0
      current_node = @head
      while current_node != nil
        count += 1
        current_node = current_node.next_node
      end
      count
    end
  end

  def at(index)
    if is_empty?
      "List is empty"
    elsif index > size - 1 || index < 0
      "index does not exist in list"
    else
      count = 0
      current_node = @head
      while count != index
        count += 1
        current_node = current_node.next_node
      end
      current_node
    end
  end

  def to_s
    if is_empty?
      return nil
    else
      string = ''
      current_node = @head
      while current_node != nil
        string += "( #{current_node.data} ) -> "
        current_node = current_node.next_node
      end
      string += "nil"
    end
  end

  def pop
  return nil if @head.nil?  # Return nil if the list is empty

  if @head.next_node.nil?  # If there's only one node
    popped_node = @head
    @head = nil
    return popped_node
  end

  current = @head
  while current.next_node && current.next_node.next_node
    current = current.next_node
  end

  popped_node = current.next_node
  current.next_node = nil
  popped_node
  end

  def find(value)
    return nil if is_empty?
    current_node = @head
    index = 0
    until current_node.data == value || current_node.next_node.nil?
      current_node = current_node.next_node
      index += 1
    end
    return index if current_node.data == value
    nil
  end
end

list = LinkedList.new
list.append("one")
list.append("two")
list.append("three")
p list.to_s