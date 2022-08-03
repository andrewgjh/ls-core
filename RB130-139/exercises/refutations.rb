require 'minitest/autorun'

class RefutationsTest < Minitest::Test
  def test_refutations
    arr_list = ['abc', 'nm', 'go']
    refute_includes(arr_list, "xyz")
  end
end
