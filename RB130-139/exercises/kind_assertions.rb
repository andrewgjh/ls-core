require 'minitest/autorun'

class KindTest < Minitest::Test
  def test_kind_of
    value = 1.34
    assert_kind_of(Numeric, value)
  end
end
