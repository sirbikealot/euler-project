# test_project_euler_problem_3.rb

# ruby -I lib test/test_project_euler_problem_3.rb

require 'minitest/spec'
require 'minitest/autorun'
require 'euler_project_problem_3'

class TestEulerProblem3 < Minitest::Unit::TestCase # MiniTest v4
	# should inherit from Minitest::Test for MiniTest 5

	def setup
		@g = PrimeFactorGenerator.new(13195)
		@g1 = PrimeFactorGenerator.new(24)
		@g2 = PrimeFactorGenerator.new(25)
		@g3 = PrimeFactorGenerator.new(1_000_000_000)
	end

	def test_greatest_prime_factor_of_13195
		assert_equal 29 , @g.greatest_prime_factor(13195)
	end

	def test_greatest_prime_factor_of_24
		assert_equal 3 , @g1.greatest_prime_factor(24)
	end

	def test_greatest_prime_factor_of_25
		assert_equal 5 , @g2.greatest_prime_factor(25)
	end

	def test_greatest_prime_factor_of_1_000_000_000
		assert_equal 5 , @g3.greatest_prime_factor(1_000_000_000)
	end

end

# Finished tests in 0.000891s, 4489.3378 tests/s, 4489.3378 assertions/s.

# 4 tests, 4 assertions, 0 failures, 0 errors, 0 skips
