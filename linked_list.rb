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
     while current_node.next != nil # runs if head was already given pointed to the next node
       current_node = current_node.next # changes var to next node
     end
      current_node.next = new_node # last added node is the new node instatiated
    end
  end
end