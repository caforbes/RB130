require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class TestError < StandardError; end
class NoExperienceError < TestError; end

class Employee
  def hire
    true
  end
end

class EasyTest < MiniTest::Test
  def setup
    @employee = Employee.new
  end

  def test_exception
    assert_raises(NoExperienceError) { @employee.hire }
  end
end