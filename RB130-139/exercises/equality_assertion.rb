require 'minitest/autorun'

class DownCaseTest < Minitest::Test
  def test_downcase
    assert_equal("xyz", "XYZ".downcase)
  end
end
