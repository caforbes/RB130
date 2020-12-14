require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class EasyTest < MiniTest::Test
  def setup
    @value = 2
  end

  def test_boolean
    assert_equal(true, @value.odd?, "value is not odd")
  end

  def test_boolean_2
    assert(@value.odd?, "value is not odd")
  end
end