require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class EasyTest < MiniTest::Test
  def setup
    @list = ['XYZ', 1, true]
  end

  def test_include
    assert_includes(@list, "xyz")
  end
end