# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

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

  # Item interaction

  def add(item)
    raise TypeError, "Can only add Todo objects" unless item.instance_of?(Todo)

    @todos << item
    self
  end
  alias_method :<<, :add

  def item_at(index)
    @todos.fetch(index)
  end

  def remove_at(index)
    @todos.delete(item_at(index))
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  # Marking done/undone

  def mark_done_at(index)
    todo = item_at(index)
    todo.done!
    todo
  end

  def mark_undone_at(index)
    todo = item_at(index)
    todo.undone!
    todo
  end

  def done!
    @todos.each { |todo| todo.done! }
    self
  end

  # List interrogation

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def done?
    @todos.all? { |todo| todo.done? }
  end

  # Display and conversion

  def to_s
    str = "---- #{title} ----"
    @todos.each { |todo| str << "\n" << todo.to_s }
    str
  end

  def to_a
    @todos.dup
  end

  # Collection iteration

  def each
    @todos.each { |todo| yield(todo) }
    self
  end

  def select
    new_list = TodoList.new(title)
    each { |todo| new_list << todo if yield(todo) }
    new_list
  end

  # find_by_title	takes a string as argument, and returns the first Todo object that matches the argument. Return nil if no todo is found.
  # all_done	returns new TodoList object containing only the done items
  # all_not_done	returns new TodoList object containing only the not done items
  # mark_done	takes a string as argument, and marks the first Todo object that matches the argument as done.
  # mark_all_done	mark every todo as done
  # mark_all_undone	mark every todo as not done
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)
