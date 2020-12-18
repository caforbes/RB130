require 'minitest/autorun'

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @total = 100
    @register = CashRegister.new(@total)
  end

  def test_accept_money_over
    trans = Transaction.new(15)
    trans.amount_paid = 20

    assert_equal @total, @register.total_money
    @register.accept_money(trans)
    assert_equal @total + 20, @register.total_money
  end

  def test_accept_money_exact
    trans = Transaction.new(20)
    trans.amount_paid = 20

    assert_equal @total, @register.total_money

    @register.accept_money(trans)
    assert_equal @total + 20, @register.total_money
  end

  def test_change_over
    trans = Transaction.new(15)
    trans.amount_paid = 20

    assert_equal 5, @register.change(trans)
  end

  def test_change_exact
    trans = Transaction.new(15)
    trans.amount_paid = 15

    assert_equal 0, @register.change(trans)
  end

  def test_give_receipt_int
    trans = Transaction.new(15)
    assert_output(/You've paid \$15/) { @register.give_receipt(trans) }
    # assert_output(/You've paid \$15\.00/) { @register.give_receipt(trans) }
  end

  def test_give_receipt_float
    trans = Transaction.new(15.00)
    assert_output(/You've paid \$15/) { @register.give_receipt(trans) }
    # assert_output(/You've paid \$15\.00/) { @register.give_receipt(trans) }
  end
end

class TransactionTest < Minitest::Test
  def setup
    @cost = 15
    @transaction = Transaction.new(@cost)
  end

  def test_prompt_for_payment_over
    user_payment = StringIO.new("20\n")
    assert_output(/You owe \$15/) do
      @transaction.prompt_for_payment(input: user_payment)
    end
    assert_equal 20, @transaction.amount_paid
  end

  def test_prompt_for_payment_exact
    user_payment = StringIO.new("15\n")
    assert_output(/You owe \$15/) do
      @transaction.prompt_for_payment(input: user_payment)
    end
    assert_equal 15, @transaction.amount_paid
  end

  def test_prompt_for_payment_under
    user_payment = StringIO.new("10\n" + "15\n")
    assert_output(/That is not the correct amount/) do
      @transaction.prompt_for_payment(input: user_payment)
    end
    assert_equal 15, @transaction.amount_paid
  end
end