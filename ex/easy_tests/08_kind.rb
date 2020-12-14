require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class EasyTest < MiniTest::Test
  def setup
    @value = Object.new
  end

  def test_numeric
    assert_kind_of(Numeric, @value)
  end
end