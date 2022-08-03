require 'minitest/autorun'

class OddTest < Minitest::Test
  def test_value_odd
    value = 11
    assert(value.odd?, 'Value is not odd')
  end
end
