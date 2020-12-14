require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class EasyTest < MiniTest::Test
  def setup
    @list = [1, 2, 'xyz', 'XYZ']
  end

  def test_numeric
    refute_includes(@list, 'xyz')
  end
end