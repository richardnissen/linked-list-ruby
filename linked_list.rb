require_relative 'node'

class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end
  
  def append(value)
    node = Node.new(value)
    @tail.next_node = node unless @tail == nil
    @tail = node
    @head = node if @head == nil
  end

  def prepend(value)
    node = Node.new(value)
    node.next_node = @head unless @head == nil
    @head = node
    @tail = node if @tail == nil
  end

  def size
    counter = 0
    node = @head
    until node.nil?
      node = node.next_node
      counter += 1
    end
    counter
  end

  def at(index)
    node = @head
    index.times { node = node.next_node unless node.next_node.nil? }
    node
  end

  def pop
    node = @head
    node = node.next_node until node.next_node == @tail
    saved_note = node.next_node
    node.next_node = nil
    @tail = node
    saved_note
  end

  def contains?(value)
    node = @head
    until node.nil?
      return true if node.value == value
      node = node.next_node
    end
    return false
  end

  def find(value)
    counter = 0
    node = @head
    until node.nil?
      return counter if node.value == value
      counter += 1
      node = node.next_node
    end
    nil
  end

  def to_s
    node = @head
    until node.nil?
      print "( #{node} ) -> "
      node = node.next_node
    end
  end

  def insert_at(value, index)
    node = @head
    (index - 1).times {node = node.next_node unless node.next_node.nil?}
    new_node = Node.new(value, node.next_node)
    node.next_node = new_node
  end

  def remove_at(index)
    node = @head
    (index - 1).times {node = node.next_node unless node.next_node.nil?}
    node.next_node = node.next_node.next_node
  end
end
