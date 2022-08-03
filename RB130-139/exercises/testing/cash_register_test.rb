require "minitest/autorun"

require_relative "./cash_register.rb"
require_relative "./transition.rb"

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(100)
    @transaction = Transaction.new(10)
  end

  def test_accept_money
    @transaction.amount_paid = 10
    @register.accept_money(@transaction)
    assert_equal(110, @register.total_money)
  end

  def test_change
    @transaction.amount_paid = 20
    assert_equal(10, @register.change(@transaction))
  end

  def test_give_receipt
    assert_output("You've paid $#{@transaction.item_cost}.\n") { @register.give_receipt(@transaction) }
  end
end
