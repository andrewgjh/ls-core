class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end


# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  # rest of class needs implementation

  def <<(to_do)
    raise TypeError, "Can only add Todo objects" if to_do.class != Todo
    @todos << to_do
  end

  alias_method :add, :<< 

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def to_a
    @todos.clone
  end

  def done?
    @todos.all? {|todo| todo.done?}
  end

  def item_at(idx)
    @todos.fetch(idx)
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def done!
    @todos.each {|todo| todo.done!}
  end

  def shift
    @todos.shift  
  end

  def pop
    @todos.pop
  end

  def remove_at(idx)
    raise IndexError unless (0..@todos.size).member?(idx)
    @todos.delete_at(idx)
  end
  


  def to_s
    output ="---- #{title} ----\n"
    output += @todos.map(&:to_s).join("\n")
    output
  end

  def each
    index = 0
    while index < @todos.size
      yield(@todos[index]) if block_given?
      index +=1 
    end
    self
  end
end


todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

p (list.each do |todo|
  puts todo                   # calls Todo#to_s
end)