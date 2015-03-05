# test_project_euler_problem_1.rb

require 'minitest/spec'
require 'minitest/autorun' # or is it 'minitest/unit'???
require 'euler_project_problem_1'

class TestEulerProblem1 < Minitest::Unit::TestCase # MiniTest v4
			# should inherit from Minitest::Test for MiniTest v5
	describe "#sum_of_multiples" do
		it "sums the naturals no's less than 10 that are divisible by 3 or 5" do
			assert_equal 23, sum_of_multiples(1,10)
		end
	end
end
