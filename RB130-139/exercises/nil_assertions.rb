require 'minitest/autorun'

class NilTest < Minitest::Test
  def test_not_nil
    value = nil
    assert_nil(value)
  end
end
