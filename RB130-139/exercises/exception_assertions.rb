require 'minitest/autorun'

class NoExperienceError < StandardError; end

class Employee
  def hire
    raise NoExperienceError
  end
end

class ExceptionTest < Minitest::Test
  def test_no_experience_error
    employee = Employee.new
    assert_raises(NoExperienceError) do
      employee.hire
    end
  end
end
