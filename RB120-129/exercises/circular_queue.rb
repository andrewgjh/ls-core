# class CircularQueue
#   attr_accessor :queue
#   attr_reader :max_size
 
#   def initialize(number)
#     @queue = Array.new()
#     @max_size = number
#   end

#   def dequeue
#     queue.shift
#   end

#   def enqueue(element)
#     queue.shift if queue.size >= max_size
#     queue << element
#   end
# end

# class CircularQueue
  
#   def initialize(number)
#     @queue = Array.new(number)
#     @starting_idx = 0
#     @oldest_idx = 0
#   end
  
#   def dequeue
#     return nil if queue.all? {|el| el.nil?}
#     removed_el = queue[oldest_idx]
#     queue[oldest_idx] = nil
#     @oldest_idx += 1
#     @oldest_idx = 0 if @oldest_idx == queue.size
#     removed_el
#   end
  
#   def enqueue(element)
#     dequeue if queue.all? {|el| !el.nil?}
#     queue[starting_idx] = element
#     @starting_idx += 1
#     @starting_idx = 0 if @starting_idx == queue.size
#   end
#   private
#   attr_accessor :queue, :oldest_idx, :starting_idx
# end

class CircularQueue
  
  def initialize(number)
    @queue = Array.new(number)
    @starting_idx = (0...number).cycle
    @oldest_idx = (0...number).cycle
  end
  
  def dequeue
    return nil if queue.all? {|el| el.nil?}
    current = oldest_idx.next
    removed_el = queue[current]
    queue[current] = nil
    removed_el
  end
  
  def enqueue(element)
    dequeue if queue.all? {|el| !el.nil?}
    queue[starting_idx.next] = element
  end

  private
  attr_accessor :queue, :oldest_idx, :starting_idx
end





queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)

queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil