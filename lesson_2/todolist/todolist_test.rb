require 'simplecov'
SimpleCov.start

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

    @list = TodoList.new("Today's Test Todos")
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

  def test_mark_done_at
    @list.mark_done_at(0)

    assert_equal true, @todo1.done?
    assert_equal false, @todo2.done?
    assert_equal false, @todo3.done?

    assert_raises(IndexError) { @list.mark_done_at(100) }
  end

  def test_mark_undone_at
    @todos.each { |todo| todo.done! }
    @list.mark_undone_at(1)

    assert_equal true, @todo1.done?
    assert_equal false, @todo2.done?
    assert_equal true, @todo3.done?

    assert_raises(IndexError) { @list.mark_undone_at(100) }
  end

  def test_done_bang
    @list.done!

    assert_equal true, @todo1.done?
    assert_equal true, @todo2.done?
    assert_equal true, @todo3.done?
    assert_equal true, @list.done?
  end

  def test_remove_at
    assert_equal @todo2, @list.remove_at(1)
    assert_equal [@todo1, @todo3], @list.to_a

    assert_raises(IndexError) { @list.remove_at(100) }
  end

  def test_to_s
    output = <<~OUTPUT.chomp
              ---- Today's Test Todos ----
              [ ] Buy milk
              [ ] Clean room
              [ ] Go to gym
              OUTPUT

    assert_equal output, @list.to_s
  end

  def test_to_s_some_done
    output = <<~OUTPUT.chomp
              ---- Today's Test Todos ----
              [X] Buy milk
              [ ] Clean room
              [ ] Go to gym
              OUTPUT

    @todo1.done!
    assert_equal output, @list.to_s
  end

  def test_to_s_all_done
    output = <<~OUTPUT.chomp
              ---- Today's Test Todos ----
              [X] Buy milk
              [X] Clean room
              [X] Go to gym
              OUTPUT

    @list.done!
    assert_equal output, @list.to_s
  end

  def test_each
    iterations = []
    @list.each { |todo| iterations << todo }

    assert_equal @todos, iterations
  end

  def test_each_returns_orig
    assert_equal @list, @list.each {}
  end

  def test_select
    assert_equal [], @list.select { |_| false }.to_a
    assert_equal @list.to_a, @list.select { |_| true }.to_a
    assert_equal @list.title, @list.select { |_| true }.title

    @todo1.done!
    assert_equal [@todo1], @list.select { |todo| todo.done? }.to_a
  end

  def test_select_new_obj
    refute_same @list, @list.select { |_| true }
  end

  def test_all_done
    assert_equal [], @list.all_done.to_a
    @todo1.done!
    assert_equal [@todo1], @list.all_done.to_a
    @todo2.done!
    @todo3.done!
    assert_equal @todos, @list.all_done.to_a
  end

  def test_all_not_done
    assert_equal @todos, @list.all_not_done.to_a
    @todo1.done!
    @todo2.done!
    assert_equal [@todo3], @list.all_not_done.to_a
    @todo3.done!
    assert_equal [], @list.all_not_done.to_a
  end

  def test_find_by_title
    assert_equal @todo1, @list.find_by_title("Buy milk")
    assert_nil @list.find_by_title("Eat candy")
  end

  def test_mark_done
    assert_equal @todo1, @list.mark_done("Buy milk")
    assert_equal true, @todo1.done?
    assert_equal false, @todo2.done?
    assert_equal false, @todo3.done?
  end

  def test_mark_undone
    @list.done!
    assert_equal @todo1, @list.mark_undone("Buy milk")
    assert_equal false, @todo1.done?
    assert_equal true, @todo2.done?
    assert_equal true, @todo3.done?
  end

  def test_mark_done_bad_input
    assert_nil @list.mark_done("Eat candy")
    assert_equal @todos, @list.to_a
  end

  def test_mark_all_done
    assert_equal @list, @list.mark_all_done
    assert_equal true, @list.done?
  end

  def test_mark_all_undone
    @list.done!
    assert_equal @list, @list.mark_all_undone
    assert_equal false, @list.done?
    assert_equal false, @todo1.done?
    assert_equal false, @todo2.done?
    assert_equal false, @todo3.done?
  end
end
