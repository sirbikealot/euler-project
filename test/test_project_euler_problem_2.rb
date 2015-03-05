# test_project_euler_problem_2.rb

# from parent directory euler_project => ruby -I lib test/test_project_euler_problem_2.rb
require 'minitest/spec'
require 'minitest/autorun'
require 'euler_project_problem_2'

class TestEulerProblem2 < Minitest::Unit::TestCase # MiniTest v4
  # should inherit from Minitest::Test for MiniTest v5

  def setup
    @f_100 = FibonacciSeries.new(100)
  end

  def test_sum_evenFibs_to100
    assert_equal 44 , @f_100.sum_evens
  end

end
