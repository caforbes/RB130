require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"

  def test_to_a
    assert_equal @todos, @list.to_a
  end

  def test_size
    assert_equal 3, @list.size
  end

  def test_first
    assert_equal @todo1, @list.first
  end

  def test_last
    assert_equal @todo3, @list.last
  end

  def test_shift
    assert_equal @todo1, @list.shift
    assert_equal [@todo2, @todo3], @list.to_a
  end

  def test_pop
    assert_equal @todo3, @list.pop
    assert_equal [@todo1, @todo2], @list.to_a
  end

  def test_done_q
    assert_equal false, @list.done?
    @todo1.done!
    assert_equal false, @list.done?
    @todo2.done!
    @todo3.done!
    assert_equal true, @list.done?
  end

  def test_add_bad_item
    assert_raises(TypeError) { @list.add(1) }
    assert_raises(TypeError) { @list.add('task') }
    assert_raises(TypeError) { @list.add([]) }
  end

  def test_shovel
    test_todo = Todo.new("Eat candy")
    @list << test_todo
    @todos << test_todo

    assert_equal @todos, @list.to_a
  end

  def test_shovel_add_alias
    test_list = TodoList.new('Test')
    test_list << @todo1
    test_list << @todo2
    test_list << @todo3

    assert_equal @todos, test_list.to_a
  end

  def test_item_at
    assert_equal @todo1, @list.item_at(0)
    assert_equal @todo2, @list.item_at(1)

    assert_raises(ArgumentError) { @list.item_at }
    assert_raises(IndexError) { @list.item_at(100) }
  end

end
