require 'minitest/autorun'

class IncludedObjTest < Minitest::Test
  def test_included_object
    list = ['abc', "bcd", "xyz"]
    assert_includes(list, "xyz")
  end
end
