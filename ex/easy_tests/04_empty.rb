require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class EasyTest < MiniTest::Test
  def setup
    @list = ['XYZ', 1, true]
  end

  def test_empty
    assert_empty(@list, "list should be empty")
  end

  def test_empty_2
    assert_equal(true, @list.empty?, "list should be empty")
  end
end