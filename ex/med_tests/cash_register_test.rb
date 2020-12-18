require 'minitest/autorun'

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @total = 100
    @cost = 15
    @register = CashRegister.new(@total)
    @transaction = Transaction.new(@cost)
  end

  def test_accept_money
    @transaction.amount_paid = 20
    assert_equal @register.total_money, @total
    @register.accept_money(@transaction)
    assert_equal @register.total_money, @total + 20
  end
end