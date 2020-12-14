require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class List
  def process
    self.clone
  end
end

class EasyTest < MiniTest::Test
  def setup
    @list = List.new
  end

  def test_same
    assert_same(@list, @list.process)
  end
end