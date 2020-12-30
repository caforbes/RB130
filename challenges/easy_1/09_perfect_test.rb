require 'minitest/autorun'
require_relative '09_perfect'

class PerfectNumberTest < Minitest::Test
  def test_initialize_perfect_number
    assert_raises StandardError do
      PerfectNumber.classify(-1)
    end
  end

  def test_classify_deficient
    assert_equal 'deficient', PerfectNumber.classify(13)
  end

  def test_classify_deficient_one
    assert_equal 'deficient', PerfectNumber.classify(1)
  end

  def test_classify_perfect
    assert_equal 'perfect', PerfectNumber.classify(28)
  end

  def test_classify_abundant
    assert_equal 'abundant', PerfectNumber.classify(12)
  end

  def test_sum_six
    assert_equal 6, PerfectNumber.aliquot_sum(6)
  end

  def test_sum_four
    assert_equal 3, PerfectNumber.aliquot_sum(4)
  end

  def test_sum_six
    assert_equal 6, PerfectNumber.aliquot_sum(6)
  end

  def test_sum_seven
    assert_equal 1, PerfectNumber.aliquot_sum(7)
  end

  def test_sum_twentyeight
    assert_equal 28, PerfectNumber.aliquot_sum(28)
  end
end