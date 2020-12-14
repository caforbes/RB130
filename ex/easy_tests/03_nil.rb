require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class EasyTest < MiniTest::Test
  def setup
    @value = ['XYZ', 1, true, []].sample
  end

  def test_equal
    assert_nil(@value, "value must be nil")
  end

  def test_equal_2
    assert_equal(nil, @value, "value must be nil")
  end
end