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

  def select
    selected_arr = TodoList.new("Filtered List")
    each do |todo|
      selected_arr.add todo if yield(todo)
    end
    selected_arr
  end
  def find_by_title(item)
    found = nil
    each do |todo|
      if todo.title == item
        found = todo 
        break
      end
    end
    found
  end

  def all_done
    select {|todo| todo.done?}
  end

  def all_not_done
    select {|todo| !todo.done?}
  end

  def mark_done(item)
    search_item = find_by_title(item)
    search_item.done! if search_item
  end

  def mark_all_done
    each do |todo|
      todo.done!
    end
  end

  def mark_all_undone
    each do |todo|
      todo.undone!
    end
  end

end
