require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class EasyTest < MiniTest::Test
  def setup
    @value = 'XYZ'
  end

  def test_equal
    assert_equal('xyz', @value.downcase, "lowercased value must be xyz")
  end
end