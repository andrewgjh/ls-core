class Element
  attr_accessor :next
  attr_reader :datum

  def initialize(datum, next_el = nil)
    @datum = datum
    @next = next_el
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_reader :head

  def self.from_a(arr)
    new_list = new()
    unless arr.nil? || arr.empty?
      arr.reverse_each { |el| new_list.push(el) }
    end
    new_list
  end

  def initialize
    @head = nil
  end

  def size
    counter = 0
    traverse = head
    while traverse
      counter += 1
      traverse = traverse.next
    end
    counter
  end

  def peek
    head&.datum
  end

  def empty?
    size == 0
  end

  def push(datum)
    @head = Element.new(datum, head)
  end

  def pop
    old_head = head
    @head = head.next
    old_head.datum
  end

  def to_a
    arr = []
    traverse = head
    while traverse
      arr << traverse.datum
      traverse = traverse.next
    end
    arr
  end

  def reverse
    self.class.from_a(to_a.reverse)
  end
end
