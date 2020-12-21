# Your task is to write a test suite for class Text.
# In that test suite write a test for the Text method swap.
# For this exercise, you are required to use the minitest methods #setup and #teardown.

require 'minitest/autorun'
require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @f = File.open('sample_text.txt', 'r')

    @string = @f.read
    @text = Text.new(@string.clone)
  end

  def teardown
    @f.close
    puts "Error! File not closed" unless @f.closed?
  end

  def test_swap
    expected_string = <<~TEXT.chomp
      Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
      Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
      quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
      nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
      dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
      et verius meuris, et pheretre mi.
    TEXT
    actual_string = @text.swap('a', 'e')

    assert_equal expected_string, actual_string
  end

  def test_word_count
    expected_words = 72
    assert_equal expected_words, @text.word_count
  end
end