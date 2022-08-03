require "minitest/autorun"
require_relative "./transition.rb"

class TransactionTest < Minitest::Test
  def setup
    @transaction = Transaction.new(10)
  end

  def test_prompt_payment
    input = StringIO.new("10\n")
    output = StringIO.new
    @transaction.prompt_for_payment(input: input, output: output)

    assert_equal(10, @transaction.amount_paid)
  end
end
