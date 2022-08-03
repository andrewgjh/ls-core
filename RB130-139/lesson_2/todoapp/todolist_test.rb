# frozen_string_literal: true

require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'todolist'

class ToDoListTest < Minitest::Test
  def setup
    @todo1 = Todo.new('Buy milk')
    @todo2 = Todo.new('Clean room')
    @todo3 = Todo.new('Go to gym')
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    expected = TodoList.new("Today's Todos")
    expected.add(@todo2)
    expected.add(@todo3)
    assert_equal(expected, @list)
  end

  def test_all_done
    @list.mark_all_done
    assert(@list.done?)
    @list.mark_all_undone
    refute(@list.done?)
  end

  def test_not_a_todo_item_added
    assert_raises(TypeError) { @list.add(123) }
    assert_raises(TypeError) { @list.add('hello') }
  end

  def test_shovel_operator_works
    new_item = Todo.new('Get a job')
    @list << new_item
    assert_equal(4, @list.size)
    assert_equal(new_item, @list.last)
  end

  def test_alias_add_works
    new_item = Todo.new('Go to the Library')
    @list.add new_item
    assert_equal(4, @list.size)
    assert_equal(new_item, @list.last)
  end

  def test_item_at_retrieval_if_in_range
    assert_raises(IndexError) do
      @list.item_at(100)
    end
    found_item = @list.item_at(1)
    assert_equal(@todo2, found_item)
    found_item = @list.item_at(0)
    assert_equal(@todo1, found_item)
  end

  def test_mark_done_at
    assert_raises(IndexError) do
      @list.mark_done_at(100)
    end
    @list.mark_done_at(1)
    assert(@list.item_at(1).done?)
    refute(@list.item_at(0).done?)
    refute(@list.item_at(2).done?)
  end

  def test_mark_undone_at
    @todo1.done!
    @todo2.done!
    @todo3.done!
    @list.mark_undone_at(1)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_all_done_again
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_remove_at
    @list.remove_at(1)
    expected_list = TodoList.new("Today's Todos")
    expected_list.add @todo1
    expected_list.add @todo3
    assert_equal(expected_list, @list)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
      ---- Today's Todos ----
      [ ] Buy milk
      [ ] Clean room
      [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_with_completed_item
    @list.mark_done_at(1)
    output = <<~OUTPUT.chomp
      ---- Today's Todos ----
      [ ] Buy milk
      [X] Clean room
      [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_all_completed
    @list.done!
    output = <<~OUTPUT.chomp
      ---- Today's Todos ----
      [X] Buy milk
      [X] Clean room
      [X] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_each_is_iterating
    assert_same(@list, @list.each, 'Does not return the same ToDoList object')
    counter = 0
    @list.each do |todo|
      assert_equal(@list.item_at(counter), todo)
      counter += 1
    end
    assert_equal(3, counter)
  end

  def test_select
    assert_instance_of(TodoList, @list.select { false })
    refute_same(@list, @list.select { true })
    filtered = @list.select { |todo| todo.title == 'Clean room' }
    expected = [@todo2]
    assert_equal expected, filtered.to_a
  end

  def test_pop
    removed = @list.pop
    assert_equal(@todo3, removed)
    expected_list = TodoList.new("Today's Todos")
    expected_list.add(@todo1)
    expected_list.add(@todo2)
    assert_equal(expected_list, @list)
  end

  def test_find_by_title
    assert_equal(@todo1, @list.find_by_title("Buy milk"))
  end

  def test_all_not_done
    assert(@list.all_not_done)
  end

  def test_all_done
    @list.done!
    assert(@list.all_done)
  end

  def test_second_all_done
    @list.done!
    assert(@list.done?)
  end

  def test_mark_done_item_name
    @list.mark_done("Buy milk")
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end
end
